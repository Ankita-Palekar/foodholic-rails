class Recipe < ActiveRecord::Base
	has_many :ratings
	belongs_to :user
	has_and_belongs_to_many :ingredients, :before_add => :validates_ingredient

	validates :title, presence: true
	validates :user_id, presence: true
	validates :method, presence: true


	def validates_ingredient(ingredient)
	  raise ActiveRecord::Rollback if self.ingredients.include? ingredient
	end

end