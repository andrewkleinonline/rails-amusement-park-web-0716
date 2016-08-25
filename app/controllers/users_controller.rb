class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # binding.pry
      #redirect_to sessions, params: params
      #redirect_to root
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # binding.pry
    if session[:user_id]

    else
      # binding.pry
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
