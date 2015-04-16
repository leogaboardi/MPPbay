class TransactionMailer < ApplicationMailer
  default from: ENV['gmail_username']

  def offer_email(buyer_id, seller_id,comment)
    @buyer = User.find(buyer_id)
    @seller = User.find(seller_id)
    #@offers = Offer.where(:buyer_id == buyer_id)
    @offers = Cart.joins(:item).where('buyer_id = ? AND user_id = ?', @buyer.id, @seller.id)

    @comment = comment
    mg_client = Mailgun::Client.new ENV['api_key']
      mail(to: @seller.email, subject: 'Sample Email')
      #mg_client.send_message ENV['domain'], message_params
  end
end
