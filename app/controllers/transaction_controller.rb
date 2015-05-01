class TransactionController < ApplicationController

  #FIXME: html email need inline styling (CSS and style section does not work)

  def new_email_offer
    @seller = User.find(params[:seller_id])
    @buyer = User.find(current_user.id)
    @offers = Cart.joins(:item).where('buyer_id = ? AND user_id = ?', @buyer.id, @seller.id)
    @pictures = Picture.all
    @prices = Price.all
    @sample_email = true

    @total_price = 0
    @offers.each do |offer|
      if !@prices.where(:item_id => offer.item.id).last.nil?
        @total_price = @total_price + @prices.where(:item_id => offer.item.id).last.value
      end
    end

  end

  def replyoffer

  end

  def checkout

  end

  def send_email_offer
    comment = params[:comment]

    TransactionMailer.offer_email(params[:buyer_id], params[:seller_id],comment).deliver_now

    carts = Cart.joins(:item).where('buyer_id = ? AND user_id = ?', params[:buyer_id], params[:seller_id])

    carts.each do |cart|
    # CREATE ITEMS IN OFFER
      offer = Offer.new
      offer.buyer_id = cart.buyer_id
      offer.item_id = cart.item.id
      if offer.save
      # DESTROY ITEMS IN CART
        cart.destroy
      end
    end

    redirect_to "/buy", :notice => "All right! Your email has been sent! Now just relax and wait for a reply!"
  end
end
