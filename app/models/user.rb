class User < ApplicationRecord
  has_many :wikis, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmables

  enum role: [:standard, :premium, :admin]

  before_save { self.role ||= :standard }

end