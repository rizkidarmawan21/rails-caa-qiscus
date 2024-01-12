class AgentService 
    def self.sincronize
        response_body = QiscusService.getAgents
        response_body = JSON.parse(response_body)
        
        response_body["data"]["agents"].each do |agent|
            # check if agent exist update else create
            @agent = Agent.find_by(agent_reference: agent["id"])

            if @agent.present?
                data = {
                    agent_reference: agent["id"],
                    name: agent["name"],
                    email: agent["email"]
                }
                @agent.update(data)
            else
                data = {
                    agent_reference: agent["id"],
                    name: agent["name"],
                    email: agent["email"],
                    limit: 2
                }
                @agent = Agent.new(data)
                @agent.save
            end
        end
    end
end