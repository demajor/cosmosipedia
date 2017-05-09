class Wiki < ApplicationRecord
  belongs_to :user

  has_many :users
  has_many :collaborators
  # has_many :users, through: :collaborators
  has_many :collaborating_users, through: :collaborators, source: :user

  validates :user, presence: true
  default_scope { order('updated_at DESC') }
  after_initialize { self.private ||= false }

  def public?
    !self.private
  end

end