class MessagesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :user_messages]
  before_action :set_message, only: [:show, :update, :destroy]
  before_action :check_ownership, only: [:update, :destroy]

  # GET /messages
  def index
    # displays most recent message or updated message
    # @messages = Message.order("updated_at DESC")
    @messages = [] # initialize empty array
    Message.order("updated_at DESC").each do |message| # pass each message with transform_message method into empty array
      @messages << message.transform_message
    end
    render json: @messages # render the message list
  end

  # GET /messages/1
  def show
    if @message
      render json: @message.transform_message
    else
      render json: ("error:" "not found. wrong id"), status: :not_found
    end
  end

  # GET my messages for logged in user
  def my_messages
    @messages = []
    current_user.messages.order("updated_at DESC").each do |message| # pass each message with transform_message method into empty array
      @messages << message.transform_message
    end
    render json: @messages
  end

  # Get messages from a specific user
  def user_messages
    @
  end

  # POST /messages
  def create
    # @message = Message.new(message_params)
    @message = current_user.messages.create(message_params) #current_user is assigned to the message params
    if @message.save
      render json: @message.transform_message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message.transform_message
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

    # Check if the user owns the specified message
    def check_ownership
      if current_user.id != @message.user.id
        render json: {error: "This is not your message. Stop trying to update or delete that which you do not own"}, status: 401
      end
    end
end
