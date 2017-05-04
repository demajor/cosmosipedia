class Wiki < ApplicationRecord
  belongs_to :user
  has_many :users
  validates :user, presence: true
  default_scope { order('updated_at DESC') }
  after_initialize { self.private ||= false }
end
