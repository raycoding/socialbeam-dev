class UserSessionsController < ApplicationController
	def new
    flash[:error] = "Bad Request" if !current_user.nil?
    redirect_to root_url if !current_user.nil?
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "You are now logged in"
      redirect_to root_url
    else
      flash[:error] = "Login unsuccessful. Please type correct email and password"
      redirect_to :back
    end
  end
  
  def destroy
    redirect_to root_url and return if current_user_session.nil?
    current_user_session.destroy
    flash[:notice] = "You have logged out"
    redirect_to root_url
  end
end