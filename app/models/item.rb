class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: { maximum: 30, too_long: "%{count} characters is the maximum allowed"}
  validates :title, uniqueness: true

  validates :user_id, presence: true
  validates :category_1_id, presence: true
  validates :price, presence: true
  validates :description, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed" }
  validates :details, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

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
