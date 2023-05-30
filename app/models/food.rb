class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'food_id'

  validates :name, presence: true
end
