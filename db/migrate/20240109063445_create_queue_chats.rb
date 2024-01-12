class CreateQueueChats < ActiveRecord::Migration[7.1]
  def change
    create_table :queue_chats do |t|
      t.string :room_id
      t.boolean :status
      t.string :source
      t.string :name

      t.timestamps
    end
  end
end
