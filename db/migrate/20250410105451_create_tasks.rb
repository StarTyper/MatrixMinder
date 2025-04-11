class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.datetime :dueDate
      t.datetime :scheduledStart
      t.integer :estimatedDuration
      t.integer :spentTime
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
