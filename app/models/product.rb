class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category, :optional => true
  has_many :product_infos
end
