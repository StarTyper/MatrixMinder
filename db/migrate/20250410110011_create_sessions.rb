class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.references :task, null: false, foreign_key: true
      t.datetime :scheduledStartDate, null: false
      t.integer :estimatedDuration, null: false
      t.integer :spentTime, null: false, default: 0
      t.integer :status, null: false

      t.timestamps
    end
  end
end
