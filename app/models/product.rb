class Product < ApplicationRecord

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
