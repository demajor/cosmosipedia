class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  before_save { self.role ||= :standard }
  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role

    
  def admin?
    role == :admin
  end

  def premium?
    role == :premium
  end

  def standard?
    role == :standard
  end

  private

  def set_default_role
    self.role ||= :standard
  end
end
