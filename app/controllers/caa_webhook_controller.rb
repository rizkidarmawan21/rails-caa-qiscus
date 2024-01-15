class CaaWebhookController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :sincronize_agent
    
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

        json ={
            response: request
        }
        CaaWebhookLog.new(json).save
        @queue_chat = QueueChat.new(data)

        # binding.b
        
        if @queue_chat.save
            # return json

            assign_agent_to_room(request[:room_id])
            
            render json: { message: "Save response webhook success" }, status: 200
            return
        else
            
            render json: { message: "Save response webhook failed #{ @queue_chat.errors.full_messages}" }, status: 500
            return
        end
    end

    def assign_agent_to_room(room_id)
        # get agent available
        @available_agents = Agent.available_agents

        @agent = @available_agents.first

        if @agent.present?
            assign_agent =  QiscusService.assign_agent(room_id, @agent.agent_reference)
            if assign_agent
                @queue = QueueChat.where(room_id: room_id)
                @queue_id = @queue.first.id
                @queue.update(status: true)

                # history
                History.create(queue_chat_id: @queue_id, agent_id: @agent.id, is_resolve: false, assigned_at: DateTime.now)
            end
        end
    end

    def list_available_agent
        # get agent available
        @available_agents = Agent.available_agents

        render json: { message: "Get Data Available Agent" , data: @available_agents}, status: 200
        return
    end

    private
    def sincronize_agent
      AgentService.sincronize
    end
end
