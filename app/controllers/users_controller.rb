class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]

  def show
    @plants = Plant.where(user_id: @user.id).order('created_at DESC')
    @carerecords = CareRecord.where(user_id: @user.id).order('created_at DESC')
    @likes = @user.likes.includes(:likeable)
    @bookmarks = @user.bookmarks.includes(:plant)
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

  def search
    @plants = Plant.includes(:user).order('created_at DESC')
    @carerecords = CareRecord.includes(:user, :plant).order('created_at DESC')
    @users = User.search(params[:nickname])
  end

  def follow
    current_user.follow(@user)
  end

  def unfollow
    current_user.unfollow(@user)
  end

private
  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end

  def set_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "ユーザーが見つかりませんでした"
    end
  end

end
