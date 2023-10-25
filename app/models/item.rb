class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  has_one_attached :item_image
  enum is_on_sale:{ on_sale:true, sales_stop:false }

  def get_item_image(width,height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
    end

    item_image.variant(resize_to_limit: [width, height]).processed

  end

  def including_tax_price
    (excluding_tax_price * 1.1).floor
  end

end
