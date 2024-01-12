class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :histories do |t|
      t.references :queue_chat, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.datetime :assigned_at

      t.timestamps
    end
  end
end
