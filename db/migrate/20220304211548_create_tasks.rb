class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
    t.string "task"
    t.boolean "completed"
    t.date "due_date"
    t.text "details"
    t.integer "user_id"
      t.timestamps
    end
  end
end
