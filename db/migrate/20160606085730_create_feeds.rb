class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :other, default: ""
      t.string :name, default: ""
      t.string :provider, default: ""
      t.string :likes, default: ""
      t.string :insights, default: ""
      t.string :uid, default: ""
      t.timestamps null: false
    end
  end
end
