class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: destory
  has_many :orders, dependent: destroy
  has_many :cart_items, dependent: destroy

  with_options presence: do
    validates :last_name
    validates :first_name
    validates :last_name_furigana
    validates :first_name_furigana
    validates :postal_code
    validates :address
    validates :telephone_number
    validates :email
  end

end
