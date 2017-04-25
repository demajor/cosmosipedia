class Wiki < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
end
