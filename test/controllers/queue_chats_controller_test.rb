require "test_helper"

class QueueChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @queue_chat = queue_chats(:one)
  end

  test "should get index" do
    get queue_chats_url
    assert_response :success
  end

  test "should get new" do
    get new_queue_chat_url
    assert_response :success
  end

  test "should create queue_chat" do
    assert_difference("QueueChat.count") do
      post queue_chats_url, params: { queue_chat: { name: @queue_chat.name, room_id: @queue_chat.room_id, source: @queue_chat.source, status: @queue_chat.status } }
    end

    assert_redirected_to queue_chat_url(QueueChat.last)
  end

  test "should show queue_chat" do
    get queue_chat_url(@queue_chat)
    assert_response :success
  end

  test "should get edit" do
    get edit_queue_chat_url(@queue_chat)
    assert_response :success
  end

  test "should update queue_chat" do
    patch queue_chat_url(@queue_chat), params: { queue_chat: { name: @queue_chat.name, room_id: @queue_chat.room_id, source: @queue_chat.source, status: @queue_chat.status } }
    assert_redirected_to queue_chat_url(@queue_chat)
  end

  test "should destroy queue_chat" do
    assert_difference("QueueChat.count", -1) do
      delete queue_chat_url(@queue_chat)
    end

    assert_redirected_to queue_chats_url
  end
end
