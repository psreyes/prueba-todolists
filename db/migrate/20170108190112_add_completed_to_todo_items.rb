class AddCompletedToTodoItems < ActiveRecord::Migration
  def change
  	remove_column :todo_items, :completed
    add_column :todo_items, :completed, :boolean, :default => true
  end
end
