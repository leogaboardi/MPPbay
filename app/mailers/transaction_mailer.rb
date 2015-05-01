class TransactionMailer < ApplicationMailer

  def offer_email(buyer_id, seller_id,comment, test=false)
    @buyer = User.find(buyer_id)
    @seller = User.find(seller_id)

    @comment = comment
    @offers = Cart.joins(:item).where('buyer_id = ? AND user_id = ?', @buyer.id, @seller.id)
    @pictures = Picture.all
    @prices = Price.all
    @sample_email = false

    @total_price = 0
    @offers.each do |offer|
      if !@prices.where(:item_id => offer.item.id).last.nil?
        @total_price = @total_price + @prices.where(:item_id => offer.item.id).last.value
      end
    end

    html_output = render_to_string template: "transaction_mailer/offer_email"
    text_output = render_to_string template: "transaction_mailer/offer_email"
    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new ENV['api_key']

    #Used in the preview
    mail(to: @seller.email, subject: 'You\'ve received an offer for your MPPbay item')

    # Define your message parameters
    if !test
      message_params = {:from    => ENV['gmail_username'],
                        :to      => @seller.email,
                        :subject => 'You\'ve received an offer for your MPPbay item',
                        :text    => html_output.to_str,
                        :html => html_output.to_str
                     }

      # Send your message through the client
      mg_client.send_message ENV['mailer_domain'], message_params
    end
  end
end
