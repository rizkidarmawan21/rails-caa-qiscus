class History < ApplicationRecord
  belongs_to :queue_chat
  belongs_to :agent
end
