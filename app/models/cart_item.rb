class CartItem < ApplicationRecord
  belongs_to :item
  def subtotal
    (item.excluding_tax_price * 1.1).floor * amount
  end
end
