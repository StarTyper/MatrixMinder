class Task < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :task_tags
  has_many :tags, through: :task_tags

  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :priority, inclusion: { in: 0..5 }
  validates :status, inclusion: { in: 0..5 }
  validates :estimated_duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :spent_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
