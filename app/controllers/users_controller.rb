class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = @user.books
  end
  
  def create
    @user = User.find(params[:id])
    @books = @user.books
    if @user.save
     redirect_to @user, notice: 'successfully'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      @books = @user.books
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
     redirect_to @user, notice: 'successfully'
    else
     render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
