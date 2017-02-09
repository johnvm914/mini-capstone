class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :user
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
