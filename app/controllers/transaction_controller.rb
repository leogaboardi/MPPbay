class TransactionController < ApplicationController

  def email_offer
    @seller = 1
  end

  def replyoffer

  end

  def checkout

  end

  def batman
    UserMailer.welcome_email(@user).deliver_now

    redirect_to "/buy", :notice => "Thanks!"
  end
end
