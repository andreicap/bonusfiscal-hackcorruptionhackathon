class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :content_eng, :default => ""
      t.string :photo_link, :default => ""
      t.string :likes, :default => ""
      t.string :insights, :default => ""
      t.string :feed_id
      t.string :other
      t.timestamps null: false
    end
  end
end
