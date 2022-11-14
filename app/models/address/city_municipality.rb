class Address::CityMunicipality < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :region
  belongs_to :district, optional: true
  belongs_to :province, optional: true
  has_many :barangays
end
