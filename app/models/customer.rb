class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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

  def full_name = self.last_name + "" + self.first_name

  def full_name_furigana = self.last_name_furigana + "" + self.first_name_furigana

end
