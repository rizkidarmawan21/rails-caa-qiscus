require "application_system_test_case"

class CaaWebhookLogsTest < ApplicationSystemTestCase
  setup do
    @caa_webhook_log = caa_webhook_logs(:one)
  end

  test "visiting the index" do
    visit caa_webhook_logs_url
    assert_selector "h1", text: "Caa webhook logs"
  end

  test "should create caa webhook log" do
    visit caa_webhook_logs_url
    click_on "New caa webhook log"

    click_on "Create Caa webhook log"

    assert_text "Caa webhook log was successfully created"
    click_on "Back"
  end

  test "should update Caa webhook log" do
    visit caa_webhook_log_url(@caa_webhook_log)
    click_on "Edit this caa webhook log", match: :first

    click_on "Update Caa webhook log"

    assert_text "Caa webhook log was successfully updated"
    click_on "Back"
  end

  test "should destroy Caa webhook log" do
    visit caa_webhook_log_url(@caa_webhook_log)
    click_on "Destroy this caa webhook log", match: :first

    assert_text "Caa webhook log was successfully destroyed"
  end
end
