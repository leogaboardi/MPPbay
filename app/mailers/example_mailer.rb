class ExampleMailer < ActionMailer::Base
  default from: ENV['gmail_username']

  def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @user.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['domain'], message_params
  end

  def offer_email(buyer_id, seller_id)
    @buyer = User.find(buyer_id)
    @seller = User.find(seller_id)
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => @buyer.email,
                      :to      => @seller.email,
                      :subject => 'You have received an offer for your MPPbay item',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['domain'], message_params
  end
end
