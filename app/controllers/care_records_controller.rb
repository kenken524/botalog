class CareRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_carerecord, only: [:show, :edit, :update, :destroy]

  def index
    @carerecords = CareRecord.includes(:user).order('created_at DESC')
  end

  def new
    @carerecord = CareRecord.new
  end

  def create
    @carerecord = CareRecord.new(carerecord_params)
    if @carerecord.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @carerecords = CareRecord.includes(:user).order('created_at DESC')
  end

  def edit
    if @carerecord.user != current_user
      redirect_to care_record_path(@carerecord)
    end
  end

  def update
    if @carerecord.update(carerecord_params)
      redirect_to care_record_path(@carerecord)
    else
      render :edit
    end
  end

  def destroy
    @carerecord.destroy if @carerecord.user == current_user

    redirect_to root_path
  end

  private

  def carerecord_params
    params.require(:care_record).permit(:description, :care_date, :image, :plant_id).merge(user_id: current_user.id)
  end

  def set_carerecord
    @carerecord = CareRecord.find(params[:id])
  end
end
