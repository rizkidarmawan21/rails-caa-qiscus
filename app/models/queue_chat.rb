class QueueChat < ApplicationRecord
    validates :room_id, uniqueness: true
end
