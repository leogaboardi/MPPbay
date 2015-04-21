class Offer < ActiveRecord::Base
  belongs_to :buyer, class_name: "User", foreign_key: "id"
  belongs_to :item

end
