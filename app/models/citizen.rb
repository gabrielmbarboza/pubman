class Citizen < ApplicationRecord
  validates :full_name, presence: true
  validates :cpf, presence: true, uniqueness: true, cpf: true
  validates :cns, presence: true, uniqueness: true, cns: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :date_of_birth, presence: true, birth_date: true
  validates :phone, presence: true, format: { with: /\A\+[0-9]{2}\s\([0-9]{2}\)\s[0-9]{4,5}-[0-9]{4}\z/, message: 'format is not valid' }
  validates :status, presence: true

  searchkick
end
