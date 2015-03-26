class Purchase < ActiveRecord::Base
  belongs_to :item
  # belongs_to :seller
  belongs_to(:buyer, { :class_name => "User", :foreign_key => "user_id" })


end
