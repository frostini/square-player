class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.references :user, null: true, foreign_key: true
      t.string :site_id
      t.string :domain
      t.string :site_title

      t.timestamps
    end
  end
end
