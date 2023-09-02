class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  private

  def plants_params
    params.require(:plant).permit(:name, :description, :start_date, :image).merge(user_id: current_user.id)
  end

  
end
