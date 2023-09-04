class UsersController < ApplicationController
  def mypage
    @user = User.find(params[:id])
    @plants = Plant.where(user_id: @user.id).order('created_at DESC')
  end


end
