require 'sinatra'
require 'sinatra/content_for'
require 'tilt/erubis'

require_relative 'database_persistence'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
end

configure(:development) do
  require 'sinatra/reloader'
  also_reload 'database_persistence.rb'
end

before do
  @storage = DatabasePersistence.new(logger)
end

helpers do
  attr_reader :storage 

  def list_class(list)
    list_complete?(list) ? "class='complete'" : ""
  end

  def todo_class(todo)
    todo[:completed] ? "class='complete'" : ""
  end

  def remaining_todos_count(list)
    list[:todos].reject { |item| item[:completed] }.size
  end

  def todos_count(list)
    list[:todos].size
  end

  def sink_lists(lists)
    sink_completed(lists) { |list| list_complete?(list) ? 1 : 0 }
  end

  def sink_todos(todos)
    sink_completed(todos) { |todo| todo[:completed] ? 1 : 0 }
  end
end

# misc methods
def set(flag, message)
  session[flag] = message
end

def error_for_list_name(name)
  if !(1..100).cover? name.size
    'List name must be between 1 and 100 characters.'
  elsif storage.lists.any? { |list| list[:name] == name }
    'List name must be unique.'
  end
end

def error_for_todo_name(name)
  if !(1..250).cover? name.size
    'To-do item must be between 1 and 250 characters.'
  end
end

def list_complete?(list)
  return false if list[:todos].size <= 0
  remaining_todos_count(list) == 0
end

def sink_completed(array, &block)
  array.sort_by(&block).map { |item| [item, item[:id]] }
end

def load_list(id)
  n_id = id.to_i
  return nil unless n_id.to_s == id.strip

  list = storage.fetch_list(n_id)
  return list if list

  set(:error, 'The specified list was not found.')
  redirect '/lists'
end

def load_item(id)
  n_id = id.to_i
  return nil unless n_id.to_s == id.strip

  item = storage.fetch_todo(n_id)
  return item if item

  set(:error, 'The specified item was not found.')
  redirect "/lists/#{id}"
end

# end of misc methods


# root redirects to view all lists
get '/' do
  redirect '/lists'
end

# view list of lists
get '/lists' do
  erb :lists, layout: :layout, locals: { lists: storage.lists }
end

# render new list form
get '/lists/new' do
  erb :new_list, layout: :layout
end

# add new list to session
post '/lists' do
  name = params[:list_name].strip
  error = error_for_list_name(name)

  if error
    set(:error, error)
    erb :new_list, layout: :layout
  else
    storage.add_todo_list(name)
    set(:success, "List '#{name}' has been created.")
    redirect '/lists'
  end
end

# view an existing list
get '/lists/:num' do |n|
  list = load_list(n)
  erb :view_list, layout: :layout, locals: { list: list }
end

# edit existing list
get '/lists/:num/edit' do |n|
  list = load_list(n)
  erb :edit_list, layout: :layout, locals: { list: list }
end

# update existing list
post '/lists/:num' do |n|
  list = load_list(n)
  id = list[:id]
  name = params[:new_name].strip
  error = error_for_list_name(name)

  if error
    set(:error, error)
    erb :edit_list, layout: :layout, locals: { list: list }
  else
    storage.rename_list(id, name)
    set(:success, 'The list has been renamed.')
    redirect "/lists/#{id}"
  end
end

# add new todo to a list
post '/lists/:num/todos' do |n|
  list = load_list(n)
  id = list[:id]
  item = params[:todo].strip
  error = error_for_todo_name(item)

  if error
    set(:error, error)
    erb :view_list, layout: :layout, locals: { list: list }
  else
    storage.add_list_item(id, item)
    set(:success, 'To-do added')
    redirect "/lists/#{id}"
  end
end

# toggle a todo
post '/lists/:num/todos/:id/toggle' do |n, i|
  list = load_list(n)
  item = load_item(i)

  if list && item
    storage.toggle(item[:id])
    set(:success, "Item '#{item[:name]}' has been updated.")
    redirect "/lists/#{list[:id]}"
  else
    set(:error, 'No such list or item.')
    redirect "/lists/#{list[:id]}"
  end
end

# mark all to-do items complete
post '/lists/:num/todos/complete_all' do |n|
  list = load_list(n)
  id = list[:id]

  storage.complete_all(id)
  set(:success, 'All to-dos have been marked complete.')
  redirect "/lists/#{id}"
end

# delete existing list
post '/lists/:num/delete' do |n|
  list = load_list(n)
  name = list[:name]

  storage.delete_list(list[:id])
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    set(:success, "List '#{name}' has been deleted.")
    redirect '/lists'
  end
end

# delete existing todo item
post '/lists/:num/todos/:id/delete' do |n, i|
  list = load_list(n)
  list_id = list[:id]
  
  item = load_item(i)
  item_id = item[:id]

  storage.delete_item(item_id)
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204
  else
    set(:success, "Item '#{item[:name]}' has been deleted.")
    redirect "/lists/#{list_id}"
  end
end