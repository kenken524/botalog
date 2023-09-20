class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]

  def show
    @plants = Plant.where(user_id: @user.id).order('created_at DESC')
    @carerecords = CareRecord.where(user_id: @user.id).order('created_at DESC')
    @likes = @user.likes.includes(:likeable)
    @bookmarks = @user.bookmarks.includes(:plant)
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
    @user = User.find(params[:id])
  end

end
