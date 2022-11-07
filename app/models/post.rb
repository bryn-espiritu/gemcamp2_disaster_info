class Post < ApplicationRecord
  include Discard::Model
  validates :title, presence: true
  validates :content, presence: true
  validates :address, presence: true
  belongs_to :user
  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships

  extend FriendlyId
  friendly_id :unique_num, use: :slugged

end
