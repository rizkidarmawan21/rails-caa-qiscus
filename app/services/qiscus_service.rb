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

        response.body
    end
end