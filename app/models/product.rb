class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0}

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_rich_text :content

  def thumbnail
    return unless image.attached?

    image.variant(resize: '100x100^', gravity: 'center', extent: '100x100')
  end
end
