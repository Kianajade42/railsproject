class AddTaskToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :task, :string
  end
end
