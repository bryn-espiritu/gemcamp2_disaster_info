class Address::CityMunicipality < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :region
  belongs_to :district, optional: true
  belongs_to :province, optional: true
  has_many :barangays
  has_many :posts, class_name: 'Post', foreign_key: 'address_city_municipality_id'
end
