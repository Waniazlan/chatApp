class MessagesController < ApplicationController
    def create
      @current_user = current_user
      @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
    end
  
    private
  
    def msg_params
      params.require(:message).permit(:content)
    end

    def destroy
      @room = Room.find(params[:article_id])
      @message = @Room.messages.find(params[:id])
      @message.destroy
      redirect_to article_path(@room), status: :see_other
    end
   
   end

 