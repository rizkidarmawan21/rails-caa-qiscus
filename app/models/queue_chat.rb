class QueueChat < ApplicationRecord
  validates :room_id, uniqueness: true
  has_one :history
end
