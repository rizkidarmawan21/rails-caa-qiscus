class CreateCaaWebhookLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :caa_webhook_logs do |t|
      t.json :response
      t.timestamps
    end
  end
end
