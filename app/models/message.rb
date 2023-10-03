class Message < ApplicationRecord
  belongs_to :room

  # Mirror what we're doing in the turbo_stream template, but over websocket
  after_create_commit -> { broadcast_append_to room }
end
