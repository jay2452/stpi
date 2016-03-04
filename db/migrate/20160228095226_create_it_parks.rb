class CreateItParks < ActiveRecord::Migration
  def change
    create_table :it_parks do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
