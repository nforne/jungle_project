class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price_cents, presence: true
  validates :quantity, presence: true
  validates :category_id, presence: true

end
