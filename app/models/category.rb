class Category < ActiveRecord::Base
	has_many :recipes
	belongs_to :user
	validates :name, presence:true, uniqueness: true  
	validate :check_admin
	 
	def check_admin
		user = User.find_by_id(user_id)
		errors.add(:base, "user is not admin") if user.admin == 'f'
	end
end
