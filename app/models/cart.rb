class Cart < ActiveRecord::Base
  belongs_to :buyer, class_name: "User", foreign_key: "id"
  belongs_to :item

  validates :buyer_id, presence: true
  validates :item_id, presence: true
  validates :item_id, uniqueness: { scope: :buyer_id,
    message: "already in cart" }
end
