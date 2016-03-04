class CreateSubCenters < ActiveRecord::Migration
  def change
    create_table :sub_centers do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
