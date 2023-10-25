class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  def subtotal
    (order_detail.item.excluding_tax_price * 1.1).floor * amount
  end
  
end
