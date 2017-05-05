class Wiki < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  default_scope { order('updated_at DESC') }
  after_initialize { self.private ||= false }

  has_many :users

end