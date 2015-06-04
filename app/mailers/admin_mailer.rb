class AdminMailer < ApplicationMailer

  def new_user_email(user)
    @user = User.find(user)

    #Used in the preview
    mail(to: ENV['NOTIFICATION_EMAIL'], subject: 'MPPbay has a new user signed up',)

    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => ENV['NOTIFICATION_EMAIL'],
                      :subject => 'MPPbay has a new user signed up',
                      :text    => 'A new user signed up to MPPbay.'}
    mg_client.send_message ENV['mailer_domain'], message_params
  end

end
