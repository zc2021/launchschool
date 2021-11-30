class SessionPersistence
  def initialize(session)
    @session = session
    self.session[:lists] ||= []
  end

  def fetch_list(id)
    session[:lists].select { |list| list[:id] == id }[0]
  end

  def fetch_todo(list, todo_id)
    list[:todos].select { |todo| todo[:id] == todo_id }[0]
  end

  def lists
    session[:lists]
  end

  def add_todo_list(name)
    id = next_list_id
    session[:lists] << { id: id, name: name, todos: [] }
  end

  def add_list_item(id, item)
    list = fetch_list(id)
    item_id = next_todo_id(list[:todos])
    list[:todos] << { id: item_id, name: item, completed: false }
  end

  def rename_list(id, name)
    session[:lists].each { |list| list[:name] = list_name if list[:id] == list_id }
  end

  def toggle(list_id, item_id)
    list = fetch_list(list_id)
    item = fetch_todo(list, item_id)
    item[:completed] = !item[:completed]
  end

  def complete_all(id)
    list = fetch_list(id)
    list[:todos].each do |task|
      task[:completed] = true
    end
  end

  def delete_list(id)
    session[:lists].delete_if { |l| l[:id] == id }
  end

  def delete_item(list_id, item_id)
    list = fetch_list(list_id)
    list[:todos].delete_if { |todo| todo[:id] == item_id }
  end

  private

  attr_reader :session

  def next_list_id
    max_id = session[:lists].map { |list| list[:id] }.max || 0
    max_id + 1
  end

  def next_todo_id(todos)
    max_id = todos.map { |todo| todo[:id] }.max || 0
    max_id + 1
  end
end