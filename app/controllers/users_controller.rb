class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:show, :index, :new, :edit]
	def authenticate
		redirect_to new_user_session_path unless user_signed_in?
	end


	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
		@a = current_user
	end

	def index
		@book = Book.new
		@user = current_user
		@users = User.all
	end

	def new
		@book = Book.new
		@user = current_user
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(current_user)
		end
		@a = current_user
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = 'You have updated user successfully.'
			redirect_to user_path(@user.id)
		else
			flash[:notice] = 'error.'
			render :edit
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :profile_image, :introduction)
		end

end
