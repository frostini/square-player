class RemoveUserFromTracks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :tracks, :user, null: false, foreign_key: true
  end
end
