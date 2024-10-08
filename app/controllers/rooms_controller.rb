class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
  
    render "index"
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    respond_to do |format|
      format.html { redirect_to index_path, notice: 'Room was successfully deleted.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@room) }
      render "index"
    end
  end
end
