class Post < ApplicationRecord
  include Discard::Model
  validates :title, presence: true
  validates :content, presence: true
  validates :address, presence: true
  validates :ip_address, presence: true
  validates :unique_num, uniqueness: true
  belongs_to :user
  belongs_to :region, class_name: 'Address::Region', foreign_key: 'address_region_id'
  belongs_to :province, class_name: 'Address::Province', foreign_key: 'address_province_id'
  belongs_to :city_municipality, class_name: 'Address::CityMunicipality', foreign_key: 'address_city_municipality_id'

  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
  mount_uploader   :image, ImageUploader
  # extend FriendlyId
  # # friendly_id :title, use: :slugged

  after_validation :generate_short_string

  private

  def generate_short_string
    loop do
      @string_unique = sprintf "%04d", rand(-9999)
      break unless Post.exists?(unique_num: unique_num)
    end
    self.unique_num = @string_unique
  end
end
