class Session < ApplicationRecord
  belongs_to :task
  belongs_to :user

  enum status: { planned: 0, active: 1, completed: 2, cancelled: 3 }

  validates :scheduled_start_time, presence: true
  validates :estimated_duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: statuses.keys } # Ensure valid status
end
