class User < ApplicationRecord
  has_many :wikis, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmables

  # before_save { self.role ||= :standard }
  after_initialize { self.role ||= :standard }

  enum role: [:standard, :premium, :admin]

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