class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :addresses
  has_many :favorites
  has_many :items
  has_many :carts
  has_many :offers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
