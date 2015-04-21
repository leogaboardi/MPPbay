class TransactionMailer < ApplicationMailer
  default from: ENV['gmail_username']

  def offer_email(buyer_id, seller_id,comment)
    @buyer = User.find(buyer_id)
    @seller = User.find(seller_id)

    @comment = comment
    @offers = Cart.joins(:item).where('buyer_id = ? AND user_id = ?', @buyer.id, @seller.id)
    @pictures = Picture.all
    @prices = Price.all
    @sample_email = false

    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new ENV['api_key']

    # Define your message parameters
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @seller.email,
                      :subject => 'You\'ve received an offer for your MPPbay item',
                      :text    => 'Test'
                    #  :html => '<html>dsdasdas</html>'
                    }

    # Send your message through the client
    mg_client.send_message ENV['domain'], message_params

  end
end
