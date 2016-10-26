class SessionsController < ApplicationController
  # before_action :doorkeeper_authorize!, only: [:logout]

  def index
  end

  def login
    unless params[:sign_in][:username] && params[:sign_in][:password]
      invalid_credentials_detected && return
    end
    invalid_credentials_detected && return unless authorized_user
    session[:user_id] = authorized_user.id
    login_route
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def login_route
    if session[:return_route]
      redirect_to session[:return_route]
    else
      redirect_to root_path, notice: "You have successfully signed in"
    end
  end

  def authorized_user
    @user = User.find_by(username: params[:sign_in][:username])
    @user.authenticate(params[:sign_in][:password]) if @user
  end

  def invalid_credentials_detected
    redirect_to "index", notice: "Invalid login details"
  end
end
