class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items

  attachment :image

  validates :name, presence:  true
end
