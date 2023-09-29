class CareRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_carerecord, only: [:show, :edit, :update, :destroy]

  def index
    redirect_back(fallback_location: root_path)
  end
  
  def search
    @plants = Plant.includes(:user).order('created_at DESC')
    @carerecords = CareRecord.search(params[:name])
    @users = User.all.order('created_at DESC')
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
    @comments = @carerecord.comments.includes(:user)
    @comment = Comment.new(commentable: @carerecord)
    @likes = @carerecord.likes.includes(:user)
    @user = @carerecord.user
    if user_signed_in? # ユーザーがログインしている場合
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
  
        if @isRoom != true
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end  

  def edit
    return unless @carerecord.user != current_user
      redirect_to care_record_path(@carerecord)
    
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
    begin
      @carerecord = CareRecord.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_back(fallback_location: root_path)
    end
  end
end
