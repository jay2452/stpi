class AddSlugToDownload < ActiveRecord::Migration
  def change
    add_column :downloads, :slug, :string
    add_index :downloads, :slug, unique: true
  end
end
