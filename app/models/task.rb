class Task < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :task_tags
  has_many :tags, through: :task_tags

  enum :status, {
    planned: 0,
    active: 1,
    completed: 2,
    cancelled: 3,
    on_hold: 4
  }

  enum :priority, {
    low: 0,
    medium: 1,
    high: 2
  }

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 500 }
  # validate duedate correct date time value
  # validate sheduled start format
  validates :estimated_duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :spent_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :priority, inclusion: { in: priorities.keys }
  validates :status, inclusion: { in: statuses.keys }
end
