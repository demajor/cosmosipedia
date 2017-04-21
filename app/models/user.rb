class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_create :send_admin_mail

  has_many :wikis, dependent: :destroy

  enum role: [:standard, :premium, :admin]

  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end 
end
