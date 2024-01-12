class AddLimitToAgents < ActiveRecord::Migration[7.1]
  def change
    add_column :agents, :limit, :integer
  end
end
