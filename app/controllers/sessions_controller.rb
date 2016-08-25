class SessionsController < ApplicationController

  def homepage
    session[:user_id] = nil
  end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    # binding.pry
    if @user
      # binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.new(name: params[:user][:name])
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    #binding.pry
    redirect_to root_path
  end

end
