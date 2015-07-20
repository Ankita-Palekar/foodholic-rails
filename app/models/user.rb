class User < ActiveRecord::Base
	has_many :recipes
	has_many :ratings

	attr_accessible :email, :password, :password_confirmation, :name
	EMAIL_REGEX	=	/([A-Z]|[a-z]|[0-9])\w+(.)*@([a-z]|[A-Z]|[0-9])\w+(.)([a-z]|[A-z]|[0-9])+/
	has_secure_password
 	validates_presence_of :password, :on => :create
	validates :email, :presence	=>	true, :uniqueness	=>	true,	:format	=>	EMAIL_REGEX
end


# def create
#   @user = User.new params[:user]
#   @user.save!
#   redirect_to user_path(@user)
# rescue ActiveRecord::RecordNotSaved
#   flash[:notice] = 'Unable to create user'
#   render :action => :new
# end