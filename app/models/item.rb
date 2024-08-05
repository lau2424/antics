class Item < ApplicationRecord
  # Associations
  belongs_to :user
  
  # Validations
  validates :price, :content, :category, :width, :length, :century, :name, :style, :height, :depth, :status, :matter, presence: true
  validates :price, :width, :length, :height, :depth, numericality: { only_integer: true }
  # Ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["category", "century", "content", "created_at", "depth", "height", "id", "length", "matter", "name", "price", "status", "style", "updated_at", "user_id", "width"]
  end
end