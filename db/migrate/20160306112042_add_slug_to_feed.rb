class AddSlugToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :slug, :string
    add_index :feeds, :slug, unique: true
  end
end
