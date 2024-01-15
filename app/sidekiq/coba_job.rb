class CobaJob
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    puts "Cronjob Assign Agent To Queue Chat Running"
    puts "Pekerjaan dijalankan setiap detik pada #{Time.now}"
    @available_agents = Agent.available_agents

    @agent = @available_agents.first

    # get queue chat order by asc
    @queue_chat = QueueChat.where(status: false).order('created_at ASC').first

    if @agent.present? && @queue_chat.present?
      assign = QiscusService.assign_agent(@queue_chat.room_id, @agent.agent_reference)

      if assign
        @queue_chat.update(status: true)
        History.create(room_id: @queue_chat.room_id, agent_id: @agent.id, is_resolve: false, assigned_at: DateTime.now)
      else
        puts "Assign Agent Failed"
      end
    end
  end
end
