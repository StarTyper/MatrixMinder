class Tag < ApplicationRecord
  belongs_to :user
  has_many :task_tags
  has_many :tasks, through: :task_tags

  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :color, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 16777215 }, allow_nil: true
end
