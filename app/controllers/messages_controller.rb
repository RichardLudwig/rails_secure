class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new]

  # GET /messages
  # GET /messages.json
  def index
    @pagy, @messages = pagy(Message.all, items: 5)
  end

  def search
    # searches for messages with case-insensitive search query in message name, email, or content
    @messages = Message.where("name ILIKE ? OR email ILIKE ? OR message ILIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")
    @pagy, @messages = pagy(@messages, items: 5)
    # if no messages found for search query, redirect to messages index
    if @messages.length == 0
      redirect_to messages_url
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:name, :email, :message)
    end
end
