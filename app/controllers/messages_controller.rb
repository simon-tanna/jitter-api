class MessagesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    # displays most recent message or updated message
    @messages = Message.order("updated_at DESC")

    render json: @messages
  end

  # GET /messages/1
  def show
    if @message
      render json: @message
    else
      render json: ("error:" "not found. wrong id"), status: :not_found
    end
  end

  # POST /messages
  def create
    # @message = Message.new(message_params)
    @message = current_user.messages.create(message_params) #current_user is assigned to the message params
    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:text)
    end
end
