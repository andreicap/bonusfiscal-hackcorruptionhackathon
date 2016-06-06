class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :photo_link, :default => ""
      t.string :likes, :default => ""
      t.string :insights, :default => ""
      t.string :uid
      t.string :other
      t.timestamps null: false
    end
  end
end
