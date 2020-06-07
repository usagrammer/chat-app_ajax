class MessagesController < ApplicationController
  before_action :set_room

  def index
     @message = Message.new
     @messages = @room.messages
   end

   def create
     @message = @room.messages.new(message_params)
     if @message.save
       redirect_to room_messages_path(@room)
     else
      redirect_to room_messages_path(@room)
     end
   end


   private

   def message_params
     params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
   end

   def set_room
     @room = Room.find(params[:room_id])
   end

 end
