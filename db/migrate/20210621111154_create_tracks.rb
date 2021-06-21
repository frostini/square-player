class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.integer :position
      t.string :link

      t.timestamps
    end
  end
end
