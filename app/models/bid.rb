class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :price, presence: true
end
