class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
