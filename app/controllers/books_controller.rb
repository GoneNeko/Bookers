class BooksController < ApplicationController
	before_action :authenticate_user!, only:[:index, :show, :edit]
	def authenticate
		redirect_to new_user_session_path unless user_signed_in?
	end


	def index
		@book = Book.new
		@user = current_user
		@books = Book.all
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = 'You have creatad book successfully.'
			redirect_to book_path(@book)
		else
			flash[:notice] = 'error'
			@user = current_user
			@books = Book.all
			render :index
		end
	end

	def show
		@book = Book.new
		@books = Book.find(params[:id])
		@user = @books.user
		@a = current_user
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = 'You have updated book successfully.'
			redirect_to book_path(@book.id)
		else
			flash[:notice] = 'error.'
			redirect_to book_path(@book.id)
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
