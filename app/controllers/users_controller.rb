class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url,:notice => "You have been registered successfully.You can now log in."
    else
      flash[:error]=@user.errors.full_messages
      redirect_to :back
    end
  end

end