class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmables

  has_many :wikis

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