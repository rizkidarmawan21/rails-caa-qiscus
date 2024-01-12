class CaaWebhookController < ApplicationController
    skip_before_action :verify_authenticity_token
    def webhook
        # return params.inspect
        Rails.logger.info "webhook"

        request = params
        data = {
            room_id: request[:room_id],
            name: request[:name],
            source: request[:source],
            status: false
        }

        $queue = QueueChat.find_by(room_id: request[:room_id])

        @queue_chat = QueueChat.new(data)

        # binding.b
        
        if @queue_chat.save
            # return json
            render json: { message: "Save response webhook success" }, status: 200
            return
        else
            render json: { message: "Save response webhook failed #{ @queue_chat.errors.full_messages}" }, status: 500
            return
        end
        
    end
end
