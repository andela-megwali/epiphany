class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]

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

  def update
  end

  def show
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :email,
      :username,
      :password
    )
  end
end
