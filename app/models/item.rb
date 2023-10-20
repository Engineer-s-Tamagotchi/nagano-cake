class Item < ApplicationRecord
  belongs_to :gen
  enum is_on_sale:{ on_sale:true, sales_stop:false }
end
