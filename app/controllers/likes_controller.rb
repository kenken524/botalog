class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @likable = find_likable
    if @likable.likes.exists?(user_id: current_user.id)
      flash[:alert] = "すでにいいね済みです。"
      redirect_back(fallback_location: root_path)
    else
      @like = Like.create(likable: @likable, user: current_user)
    end
    @plant = find_likable
    @carerecord = find_likable
  end

  def destroy
    @like = Like.find_by(likable: find_likable, user: current_user)
    if @like.user == current_user
      @like.destroy
    else
      flash[:alert] = "いいねの取り消しに失敗しました。"
    end
    @plant = find_likable
    @carerecord = find_likable
  end

  private

  def find_likable
    if params[:plant_id]
      Plant.find(params[:plant_id])
    elsif params[:care_record_id]
      CareRecord.find(params[:care_record_id])
    end
  end
end