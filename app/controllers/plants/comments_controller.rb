class Plants::CommentsController < ApplicationController
  before_action :set_plant
  before_action :authenticate_user!, only: [:create]

  def create
    @comment = @plant.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end