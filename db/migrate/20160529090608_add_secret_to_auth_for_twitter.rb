class AddSecretToAuthForTwitter < ActiveRecord::Migration
  def up
    change_table :authentications do |t|
      t.string :secret, :default => ""
    end
  end

  def down
    remove_column :authentications, :secret
  end
end
