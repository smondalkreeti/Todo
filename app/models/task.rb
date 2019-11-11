class Task < ApplicationRecord
  belongs_to :user
  validates :description, :scheduled, presence: true
  validates :status, null: false
  scope :order_desc, -> { order(created_at: :desc) }
end
