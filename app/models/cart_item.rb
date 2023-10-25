class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  def subtotal
    (item.excluding_tax_price * 1.1).floor * amount
  end
end
