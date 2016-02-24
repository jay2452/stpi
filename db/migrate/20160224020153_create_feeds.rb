class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.text :topic

      t.timestamps null: false
    end
  end
end
