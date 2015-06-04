class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  include ApplicationHelper

  has_many :addresses
  has_many :favorites
  has_many :items
  has_many :carts
  has_many :offers

  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true, :uniqueness => true
  validate :check_whitelist
  after_create :send_admin_mail

  def send_admin_mail
    AdminMailer.new_user_email(User.last).deliver_now
  end

  def check_whitelist
    if not whitelist.include? email.split("@").last
      errors.add(:email, ": your email address cannot participate in the beta yet =(")
    end
  end
end
