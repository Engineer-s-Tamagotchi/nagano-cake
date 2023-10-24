class Order < ApplicationRecord

  belongs_to :user
  has_many :order_details, dependent: :destroy

  with_options presence: do
    validates :name
    validates :billing_price
    validates :payment_method
    validates :postage
    validates :postal_code
    validates :address
    validates :status
  end

  enum payment_method:{ クレジットカード: 0, 現金振込: 1 }
  enum status:{ 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

end
