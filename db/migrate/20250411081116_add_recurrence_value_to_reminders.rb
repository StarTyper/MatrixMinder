class AddRecurrenceValueToReminders < ActiveRecord::Migration[7.1]
  def change
    add_column :reminders, :recurrence_value, :integer, default: 0000000, null: false
  end
end
