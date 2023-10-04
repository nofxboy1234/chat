class Message < ApplicationRecord
  belongs_to :room

  # Mirror what we're doing in the turbo_stream template, but over websocket
  # broadcasts_to :room, target: 'messages2'
  after_create_commit -> { broadcast_append_to room, :messages2, target: 'messages2' }
  after_destroy_commit -> { broadcast_remove_to room, :messages2, target: 'messages2' }
  after_update_commit -> { broadcast_replace_to room, :messages2, target: 'messages2' }
end
