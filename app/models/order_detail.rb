class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal

    self.including_tax_price * self.amount
  end
  
  enum production_status:{ start_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3,}

end
