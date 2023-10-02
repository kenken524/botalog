class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @plant = Plant.find(params[:plant_id])

    if @plant.bookmarks.exists?(user_id: current_user.id)
      redirect_back(fallback_location: root_path)
    else
      @bookmark = Bookmark.create(plant: @plant, user: current_user)
    end
  end

  def destroy
    @plant = Plant.find(params[:plant_id])
    @bookmark = Bookmark.find_by(plant: @plant, user: current_user)

    return unless @bookmark.user == current_user
      @bookmark.destroy
    
  end
end
