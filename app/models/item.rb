class Item < ActiveRecord::Base
  validates :title, presence: true

  has_many :favorites
  has_many :prices
  has_many :pictures

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :status
  belongs_to :availability

end
