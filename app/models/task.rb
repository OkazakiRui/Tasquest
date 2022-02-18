class Task < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :deadline
    validates :priority, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  end
end
