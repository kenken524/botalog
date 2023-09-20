class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
  end
end
