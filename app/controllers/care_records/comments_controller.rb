class CareRecords::CommentsController < ApplicationController
  before_action :set_care_record
  before_action :authenticate_user!, only: [:create]

  def create
    @comment = @carerecord.comments.new(comment_params)
    @comment.user = current_user

    return if @comment.save 
      render 'error'
    
  end

  private

  def set_care_record
    @carerecord = CareRecord.find(params[:care_record_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
