class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  has_many :food, through: :recipe_food
  validates :name, presence: true
  validates :preparation_time, :cooking_time, presence: true, numericality: { only_integer: true,
                                                                              greater_than_or_equal_to: 0 }
end
