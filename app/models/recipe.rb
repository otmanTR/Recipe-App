class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: { message: 'Name is required' },
                   length: { minimum: 3, message: 'Name must be at least 3 characters' }
  validates :description, presence: { message: 'Description is required' },
                          length: { maximum: 1000, message: 'Description must be at most 1000 characters' }
end
