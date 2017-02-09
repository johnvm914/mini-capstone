class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => { :greater_than => 0 }
  validates :description, presence: true, length: { maximum: 500 }

  def sale_message
    if price < 2
      "Discount Item!"
    else
      "Everday Value!!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
