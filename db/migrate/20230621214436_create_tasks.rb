class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :area
      t.string :item
      t.text :picture
      t.string :task_name
      t.text :task_descr
      t.string :frequency
      t.string :due_date

      t.timestamps
    end
  end
end
