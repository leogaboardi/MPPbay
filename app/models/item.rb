class Item < ActiveRecord::Base
  validates :title, presence: true

  has_many :favorites
  has_many :prices
  has_many :pictures
  has_one :purchase
  has_many :carts
  has_many :offers

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :status
  belongs_to :availability

end
