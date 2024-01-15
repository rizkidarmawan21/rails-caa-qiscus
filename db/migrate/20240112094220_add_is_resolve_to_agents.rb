class AddIsResolveToAgents < ActiveRecord::Migration[7.1]
  def change
    add_column :agents, :is_resolve, :boolean
  end
end
