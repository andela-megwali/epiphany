class SessionsController < ApplicationController
  def index
  end

  def login
    if params[:sign_in][:username] && params[:sign_in][:password]
      @user = User.find_by(username: params[:sign_in][:username])
      authorized_user = @user.authenticate(params[:sign_in][:password]) if @user
      session[:user_id] = authorized_user.id if authorized_user
      login_route
    else
      redirect_to "index", notice: "Invalid login details"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "index"
  end

  private

  def login_route
    if session[:return_route]
      redirect_to session[:return_route]
    else 
      redirect_to root_path, notice: "You have successfully signed in"
    end
  end
end
