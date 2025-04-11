class Reminder < ApplicationRecord
  belongs_to :task
  belongs_to :user

  enum recurrence_pattern: {
    daily: 0,
    weekly: 1,
    monthly: 2,
    yearly: 3,
    custom_weekly: 4
  }


  # Set recurrence days for custom weekly pattern starting on Monday
  def set_weekly_days(days_array)
    self.recurrence_pattern = :custom_weekly
    self.recurrence_value = days_to_integer(days_array)
  end

  # Convert days (e.g., [0, 1]) to integer representation (Monday=0, ..., Sunday=6)
  def days_to_integer(days)
    days.inject(0) { |acc, day| acc | (1 << (day - 1)) } # Subtract 1 to align, example: 1 for Monday
  end

  # Convert the integer back to an array of days
  def integer_to_days(value)
    (0..6).select { |day| value[day] == 1 } # Map back to array from integer
  end

  enum status: { active: 0, completed: 1, cancelled: 2 }
  enum notification_type: { in_app: 0, email: 1, push_notification: 2 }

  validates :dateTime, presence: true
  validates :status, inclusion: { in: statuses.keys } # Ensure valid status
  validates :notification_type, inclusion: { in: notification_types.keys } # Ensure valid notification type
  validates :message, length: { maximum: 255 }, allow_nil: true # Optional message field
  validates :recurring, inclusion: { in: [true, false] } # Ensure valid recurring status
  validates :recurrence_pattern, presence: true
  validates :recurrence_value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :frequency, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_nil: true
end
