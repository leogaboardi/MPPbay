class TransactionController < ApplicationController

  # FIXME: the email offer has a preset list of items. But the buyer
  # can add delete items in the email body - how to conciliate that?
  def new_email_offer
    @seller = User.find(params[:seller_id])
    @buyer = User.find(current_user.id)
    @offers = Cart.joins(:item).where('buyer_id = ? AND user_id = ?', @buyer.id, @seller.id)

    @prices = Price.all
    @total_price = 0
    @sample_email = true

=begin
    @text_template = "Hello,\nI saw some things you put on sale on MPPbay and I am interesting in the following:\n\n"
    @carts.each do |cart|
      if !Price.where(:item_id== cart.item.id).last.nil?
        price = Price.where(:item_id== cart.item.id).last.value
      else
        price = 0
      end
      @text_template = @text_template+cart.item.title+
      ", for $"+"%.2f" % price.to_s+"\n"
      @total_price = @total_price+price.to_f
    end
    @text_template = @text_template + "Total price: $"+"%.2f" % @total_price.to_s
    @text_template = @text_template + "\nPlease let me know if you are interested in selling them.\n\nBest,\n"+current_user.name
=end
  end

  def replyoffer

  end

  def checkout

  end

  def send_email_offer
    comment = params[:comment]
#    @offers = Cart.joins(:item).where('buyer_id = ? AND user_id = ?', @buyer.id, @seller.id)

    TransactionMailer.offer_email(params[:buyer_id], params[:seller_id],comment).deliver_now

    # CREATE ITEMS IN OFFER

    # DESTROY ITEMS IN CART

    redirect_to "/buy", :notice => "All right! Your email has been sent! Now just relax and wait for a reply!"
  end
end
