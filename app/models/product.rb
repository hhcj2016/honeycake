class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category, :optional => true
  has_many :product_infos

  belongs_to :user

  has_many :favorites, :dependent => :destroy
  has_many :favorite_users, :through => :favorites, :source => :user

  def find_favorite(user)
    self.favorites.where( :user_id => user.id).first
  end

end
