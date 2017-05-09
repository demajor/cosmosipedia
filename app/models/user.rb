class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  has_many :collaborators
  has_many :collaborating_wikis, through: :collaborators, source: :wiki

  validates_associated :wikis
  validates_associated :collaborators

  before_create { self.role ||= :standard }
  before_save { self.email ||= email.downcase }
  after_initialize { self.role ||= :standard }

  enum role: [:standard, :premium, :admin]

  def downgrade
    self.standard!
    self.wikis.update_all(private: false)
  end

  def toggle_role
    if self.role == 'standard'
      update_attributes(role: :premium)
      return true
    elsif 
      self.role == 'premium' || self.role == 'admin'
      update_attributes(role: :standard)
      return true
    else
      return false
    end
  end
end