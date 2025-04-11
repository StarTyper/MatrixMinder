class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.references :task, null: false, foreign_key: true
      t.datetime :dateTime, null: false
      t.integer :status, null: false, default: 0
      t.integer :notificationType, null: false, default: 0
      t.string :message
      t.boolean :recurring, null: false, default: false
      t.integer :recurrencePattern, null: false, default: 0
      t.integer :frequency, null: false, default: 1

      t.timestamps
    end
  end
end
