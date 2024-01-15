require "test_helper"

class CaaWebhookLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caa_webhook_log = caa_webhook_logs(:one)
  end

  test "should get index" do
    get caa_webhook_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_caa_webhook_log_url
    assert_response :success
  end

  test "should create caa_webhook_log" do
    assert_difference("CaaWebhookLog.count") do
      post caa_webhook_logs_url, params: { caa_webhook_log: {  } }
    end

    assert_redirected_to caa_webhook_log_url(CaaWebhookLog.last)
  end

  test "should show caa_webhook_log" do
    get caa_webhook_log_url(@caa_webhook_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_caa_webhook_log_url(@caa_webhook_log)
    assert_response :success
  end

  test "should update caa_webhook_log" do
    patch caa_webhook_log_url(@caa_webhook_log), params: { caa_webhook_log: {  } }
    assert_redirected_to caa_webhook_log_url(@caa_webhook_log)
  end

  test "should destroy caa_webhook_log" do
    assert_difference("CaaWebhookLog.count", -1) do
      delete caa_webhook_log_url(@caa_webhook_log)
    end

    assert_redirected_to caa_webhook_logs_url
  end
end
