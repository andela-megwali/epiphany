class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Sign Up Successful"
    else
      render "new", notice: "Error"
    end
  end

  def edit
    
  end
  
  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password)
  end
end
