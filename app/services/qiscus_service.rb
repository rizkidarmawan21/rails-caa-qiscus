class QiscusService
    include HTTParty
    base_uri 'https://omnichannel.qiscus.com/api'
    
    def self.auth
        email = ENV['QISCUS_EMAIL']
        password = ENV['QISCUS_CREDENTIAL']

        response = post('/v1/auth', body: { email: email, password: password }.to_json, headers: { 'Content-Type' => 'application/json' })
         # Lakukan sesuatu dengan response, misalnya, return response body
        response_body = JSON.parse(response.body)

        response_body["data"]["user"]["authentication_token"]
    end

    def self.getAgents
        token = QiscusService.auth
        app_id = ENV['QISCUS_APP_ID']

        response = get('/v2/admin/agents', headers: { 'Content-Type' => 'application/json', 'Authorization' => token, 'Qiscus-App-Id' => app_id })

        if response.code == 200
            return response.body
        else
            return nill
        end
    end

    def self.assign_agent(room_id ,agent_id)
        room = room_id
        agent = agent_id
        Rails.logger.info "room= #{room}"
        Rails.logger.info "agent=  #{agent}"
        app_id = ENV['QISCUS_APP_ID']
        app_key = ENV['QISCUS_APP_KEY']

        response = post('/v1/admin/service/assign_agent', body: { room_id: room_id, agent_id: agent_id }.to_json, headers: { 'Content-Type' => 'application/json','Qiscus-App-Id' => app_id, 'Qiscus-Secret-Key' => app_key })

        CaaWebhookLog.new({response:response}).save
        if response.code == 200
            # return true
            return true
        else
            # return information for error response
            return false
        end
    end

    def self.resolve(room_id)
        app_id = ENV['QISCUS_APP_ID']
        app_key = ENV['QISCUS_APP_KEY']

        response = post('/v1/admin/service/mark_as_resolved', body: { room_id: room_id }.to_json, headers: { 'Content-Type' => 'application/json','Qiscus-App-Id' => app_id, 'Qiscus-Secret-Key' => app_key })

        CaaWebhookLog.new({response:response}).save
        if response.code == 200
            # return true
            return true
        else
            # return information for error response
            return false
        end
    end
end