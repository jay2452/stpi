class CreateConsultancies < ActiveRecord::Migration
  def change
    create_table :consultancies do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
