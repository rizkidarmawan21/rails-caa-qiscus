json.extract! queue_chat, :id, :room_id, :status, :source, :name, :created_at, :updated_at
json.url queue_chat_url(queue_chat, format: :json)
