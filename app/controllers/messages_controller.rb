class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
  
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      if @message.save
        redirect_to "/rooms/#{params[:message][:room_id]}"
      else
        flash[:alert] = @message.errors.full_messages.join(', ')
        redirect_to "/rooms/#{params[:message][:room_id]}"
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end
  

  private 
  def message_params
      params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id)
  end
end