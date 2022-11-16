class Address::Region < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  has_many :provinces
  has_many :districts
  has_many :city_municipalities
  has_many :barangays
  has_many :posts, class_name: 'Post', foreign_key: 'address_region_id'
end
