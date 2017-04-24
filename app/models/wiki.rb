class Wiki < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
