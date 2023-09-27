class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @plants = Plant.where(user_id: @user.id).order('created_at DESC')
    @carerecords = CareRecord.where(user_id: @user.id).order('created_at DESC')
    @likes = @user.likes.includes(:likeable)
    @bookmarks = @user.bookmarks.includes(:plant)
    @message_rooms = @user.entries.includes(:room)
    @message_rooms = @message_rooms.sort_by do |entry|
      room = entry.room
      last_message = room.messages.last
      last_message ? last_message.created_at : Time.at(0) # メッセージがない場合は古い時間を使用
    end.reverse
    if user_signed_in? # ユーザーがログインしている場合
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      @another_entry = Entry.where.not(user_id: current_user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
  
        if @isRoom != true
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end 

  def create
    @room = Room.create
    Entry.create(room_id: @room.id, user_id: current_user.id)
    Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    begin
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.all
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
    rescue ActiveRecord::RecordNotFound
      redirect_back(fallback_location: root_path)
    end
  end
end