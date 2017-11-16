class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category, :optional => true
  has_many :product_infos

  belongs_to :user



end
