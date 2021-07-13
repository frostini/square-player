class AddPlayerToTracks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tracks, :player, null: false, foreign_key: true
  end
end
