class UserMailer < ApplicationMailer
  default from: 'leonardo@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample email')
  end
end
