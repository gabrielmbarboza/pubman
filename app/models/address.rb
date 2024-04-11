class Address < ApplicationRecord
  validates :zip_code, presence: true
  validates :street, presence: true
  validates :complement, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true

  belongs_to :citizen

  def to_s
    "#{street}, #{address_number.present? ? address_number : 's/n'}, #{complement}, #{city}/#{state}, #{zip_code}"
  end
end
