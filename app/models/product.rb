class Product < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :qty, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_one_attached :image
  has_rich_text :content
end
