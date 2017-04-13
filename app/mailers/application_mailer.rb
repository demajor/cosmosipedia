class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

class UserMailer < ApplicationMailer
  default from: 'test@example.com'

  def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Greetings!")
  end

end