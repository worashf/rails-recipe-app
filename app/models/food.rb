class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  validates :name, :measurment_unit, presence: true
  validates :price, :quantity, presence: true, numericality: { only_integer: true,
                                                               greater_than_or_equal_to: 0 }
end
