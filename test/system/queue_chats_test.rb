require "application_system_test_case"

class QueueChatsTest < ApplicationSystemTestCase
  setup do
    @queue_chat = queue_chats(:one)
  end

  test "visiting the index" do
    visit queue_chats_url
    assert_selector "h1", text: "Queue chats"
  end

  test "should create queue chat" do
    visit queue_chats_url
    click_on "New queue chat"

    fill_in "Name", with: @queue_chat.name
    fill_in "Room", with: @queue_chat.room_id
    fill_in "Source", with: @queue_chat.source
    check "Status" if @queue_chat.status
    click_on "Create Queue chat"

    assert_text "Queue chat was successfully created"
    click_on "Back"
  end

  test "should update Queue chat" do
    visit queue_chat_url(@queue_chat)
    click_on "Edit this queue chat", match: :first

    fill_in "Name", with: @queue_chat.name
    fill_in "Room", with: @queue_chat.room_id
    fill_in "Source", with: @queue_chat.source
    check "Status" if @queue_chat.status
    click_on "Update Queue chat"

    assert_text "Queue chat was successfully updated"
    click_on "Back"
  end

  test "should destroy Queue chat" do
    visit queue_chat_url(@queue_chat)
    click_on "Destroy this queue chat", match: :first

    assert_text "Queue chat was successfully destroyed"
  end
end
