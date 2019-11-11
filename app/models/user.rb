class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :tasks, dependent: :destroy
end
