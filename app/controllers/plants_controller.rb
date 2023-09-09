class PlantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @plants = Plant.includes(:user).order('created_at DESC')
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @plants = Plant.includes(:user).order('created_at DESC')
    @plant = Plant.find_by(id: params[:id])
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :start_date, :image).merge(user_id: current_user.id)
  end
end