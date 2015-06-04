# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def sample_new_user_email
    AdminMailer.new_user_email(User.first)
  end
end
