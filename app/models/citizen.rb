class Citizen < ApplicationRecord
  extend Pagy::Searchkick

  validates :full_name, presence: true
  validates :cpf, presence: true, uniqueness: true, cpf: true
  validates :cns, presence: true, uniqueness: true, cns: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :date_of_birth, presence: true, birth_date: true
  validates :phone, presence: true, format: { with: /\A\+[0-9]{2}\s\([0-9]{2}\)\s[0-9]{4,5}-[0-9]{4}\z/, message: 'format is not valid' }
  validates :status, presence: true

  enum :status, { disabled: 0, enabled: 1 }, default: :enabled

  has_one_attached :photo do |attachable|
    attachable.variant :mini, resize_to_limit: [50, 67]
    attachable.variant :thumb, resize_to_limit: [100, 133]
    attachable.variant :profile, resize_to_limit: [354, 472]
  end

  has_one :address
  accepts_nested_attributes_for :address

  searchkick
end
