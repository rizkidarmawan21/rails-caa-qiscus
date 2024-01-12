class QueueChatsController < ApplicationController
  before_action :set_queue_chat, only: %i[ show edit update destroy ]

  # GET /queue_chats or /queue_chats.json
  def index
    @queue_chats = QueueChat.all
  end

  # GET /queue_chats/1 or /queue_chats/1.json
  def show
  end

  # GET /queue_chats/new
  def new
    @queue_chat = QueueChat.new
  end

  # GET /queue_chats/1/edit
  def edit
  end

  # POST /queue_chats or /queue_chats.json
  def create
    @queue_chat = QueueChat.new(queue_chat_params)

    respond_to do |format|
      if @queue_chat.save
        format.html { redirect_to queue_chat_url(@queue_chat), notice: "Queue chat was successfully created." }
        format.json { render :show, status: :created, location: @queue_chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @queue_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queue_chats/1 or /queue_chats/1.json
  def update
    respond_to do |format|
      if @queue_chat.update(queue_chat_params)
        format.html { redirect_to queue_chat_url(@queue_chat), notice: "Queue chat was successfully updated." }
        format.json { render :show, status: :ok, location: @queue_chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @queue_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queue_chats/1 or /queue_chats/1.json
  def destroy
    @queue_chat.destroy!

    respond_to do |format|
      format.html { redirect_to queue_chats_url, notice: "Queue chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queue_chat
      @queue_chat = QueueChat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def queue_chat_params
      params.require(:queue_chat).permit(:room_id, :status, :source, :name)
    end
end
