class Recipe < ApplicationRecord
       belongs_to :user

       validates :name, presence: true, length: { maximum: 250 }
       validates :description, presence: true, length: { maximum: 500 }
  
    has_many :recipe_food, foreign_key: :user_id
  
  end