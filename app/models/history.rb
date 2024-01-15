class History < ApplicationRecord
  # has_one :agent
  belongs_to :agent
  belongs_to :queue_chat
end
