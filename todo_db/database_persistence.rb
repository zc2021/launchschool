require 'pg'

class DatabasePersistence
  def initialize(logger)
    @connection = PG.connect(dbname: 'todos')
    @logger = logger
  end

  def fetch_list(id)
    sql_lists = 'SELECT * FROM lists WHERE id=$1;'
    result_lists = query(sql_lists, id)

    sql_todos = 'SELECT * FROM todos WHERE list_id=$1;'
    result_todos = query(sql_todos, id)

    sql_to_list(result_lists.first, result_todos)
  end

  def fetch_todo(id)
    sql = 'SELECT * FROM todos WHERE id=$1;'
    result = query(sql, id)

    sql_to_todo(result.first)
  end

  def lists
    sql_lists = 'SELECT * FROM lists;'
    result_lists = query(sql_lists)
    
    result_lists.map do |list|
      sql_todos = 'SELECT * FROM todos WHERE list_id=$1;'
      todos = query(sql_todos, list['id'].to_i)
      sql_to_list(list, todos)
    end
  end

  def add_todo_list(name)
    sql = 'INSERT INTO lists (name) VALUES ($1);'
    query(sql, name)
  end

  def add_list_item(id, item)
    sql = 'INSERT INTO todos (name, list_id) VALUES ($1, $2);'
    query(sql, item, id)
  end

  def rename_list(id, name)
    sql = 'UPDATE lists SET name=$1 WHERE id=$2;'
    query(sql, name, id)
  end

  def toggle(id)
    sql = 'UPDATE todos SET completed=NOT completed WHERE id=$1'
    query(sql, id)
#    list = fetch_list(list_id)
#    item = fetch_todo(list, item_id)
#    item[:completed] = !item[:completed]
  end

  def complete_all(id)
    sql = 'UPDATE todos SET completed=TRUE WHERE list_id=$1'
    query(sql, id)
#    list = fetch_list(id)
#    list[:todos].each do |task|
#      task[:completed] = true
#    end
  end

  def delete_list(id)
    sql = 'DELETE FROM lists WHERE id=$1;'
    query(sql, id)
  end

  def delete_item(item_id)
    sql = 'DELETE FROM todos WHERE id=$1;'
    query(sql, item_id)
  end

  private

  attr_reader :connection, :logger

  def sql_to_list(list, todos=[])
    {
      id: list['id'],
      name: list['name'],
      todos: todos.map { |td| sql_to_todo(td) }
    }
  end

  def sql_to_todo(todo)
    {
      id: todo['id'],
      name: todo['name'],
      completed: todo['completed'] == 't'
    }
  end

  def query(statement, *params)
    logger.info "#{statement} | #{params}"
    connection.exec_params(statement, params)
  end
end