class Agent < ApplicationRecord
  has_many :histories, foreign_key: 'agent_id'

  def self.available_agents
    # .where('histories.is_resolve = ? OR histories.is_resolve IS NULL', false)
    agents = select('agents.id, agents.name,agents.agent_reference, agents.limit - COUNT(CASE WHEN histories.is_resolve = false OR histories.is_resolve IS NULL THEN histories.id END) as available_limit')
              .left_joins(:histories)
              .group('agents.id, agents.name, agents.limit')
              .having('(agents.limit - COUNT(CASE WHEN histories.is_resolve = false OR histories.is_resolve IS NULL THEN histories.id END)) > 0')
              .order('COUNT(histories.id) DESC')

    return agents

  end
end
