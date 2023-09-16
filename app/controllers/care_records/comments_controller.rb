class CareRecords::CommentsController < ApplicationController
  before_action :set_care_record
  before_action :authenticate_user!, only: [:create]

  def create
    @comment = @care_record.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @care_record, notice: 'コメントが追加されました。'
    else
      render 'care_records/show'
    end
  end

  private

  def set_care_record
    @care_record = CareRecord.find(params[:care_record_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end