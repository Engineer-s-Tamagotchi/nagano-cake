class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal
    self.including_tax_price * self.amount
  end

end
