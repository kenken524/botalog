class UsersController < ApplicationController
  def mypage
    @user = User.find(params[:id])
    @plants = Plant.where(user_id: @user.id).order('created_at DESC')
    @carerecords = CareRecord.where(user_id: @user.id).order('created_at DESC')
    @likes = @user.likes.includes(:likeable)
    @bookmarks = @user.bookmarks.includes(:plant)
  end

  def new
  end

  def edit
  end

  def update
  if current_user.update(user_params)
    redirect_to user_mypage_path
  else
    render :edit
  end
  end

private
def user_params
params.require(:user).permit(:nickname, :email, :image)
end

end
