class AttractionsController < ApplicationController

  before_action :set_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
    @admin = true if User.find(session[:user_id]).admin
  end

  def show
    if session[:user_id]
      @admin = true if User.find(session[:user_id]).admin
    else
      @admin = false
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)

  end

  def edit

  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
