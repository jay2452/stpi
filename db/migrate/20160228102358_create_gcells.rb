class CreateGcells < ActiveRecord::Migration
  def change
    create_table :gcells do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
