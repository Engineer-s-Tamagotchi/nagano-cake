class Item < ApplicationRecord
  enum is_on_sale:{ on_sale:true, sales_stop:false }
end
