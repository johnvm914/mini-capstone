class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def subtotal_amount
    quantity * product.price
  end

  def tax_amount
    subtotal_amount * 0.09
  end

  def total_amount
    subtotal_amount + tax_amount
  end

end
