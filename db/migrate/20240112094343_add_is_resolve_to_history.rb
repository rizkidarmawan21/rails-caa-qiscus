class AddIsResolveToHistory < ActiveRecord::Migration[7.1]
  def change
    add_column :histories, :is_resolve, :boolean
  end
end
