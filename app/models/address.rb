class Address < ApplicationRecord

  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/

  belongs_to :customer

  def postal_code_and_address_and_name
    "〒#{self.postal_code} #{self.address} #{self.name}"
  end

  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :address, presence: true
  validates :name, presence: true

end
