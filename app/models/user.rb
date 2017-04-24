class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy

  before_save { self.role ||= :standard }
  
  enum role: [:standard, :premium, :admin]

  # after_create :send_admin_mail

  # def send_admin_mail
  #   UserMailer.send_welcome_email(self).deliver_later
  # end 
end
