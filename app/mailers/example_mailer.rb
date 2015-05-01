class ExampleMailer < ApplicationMailer

  def sample_email(user)
    @user = user

    #Used in the preview
    mail(to: @user.email, subject: 'Sample Mail using Mailgun API',)

    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @user.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['mailer_domain'], message_params
  end
end
