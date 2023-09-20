class PlantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    @plants = Plant.includes(:user).order('created_at DESC')
    @carerecords = CareRecord.includes(:user, :plant).order('created_at DESC')
    @users = User.all.order('created_at DESC')
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
    @carerecords = @plant.care_records.includes(:user).order('created_at DESC')
    @comments = @plant.comments.includes(:user)
    @comment = Comment.new(commentable: @plant)
    @likes = @plant.likes.includes(:user)
    @is_followed = current_user.following?(@plant.user) if user_signed_in?
    @user = @plant.user
  end

  def edit
    return if @plant.user == current_user

    redirect_to root_path
  end

  def update
    if @plant.update(plant_params)
      redirect_to plant_path
    else
      render :edit
    end
  end

  def destroy
    @plant.destroy if @plant.user == current_user

    redirect_to root_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :start_date, :image).merge(user_id: current_user.id)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end