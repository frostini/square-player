class AddLinkTitleToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :link_title, :string
  end
end
