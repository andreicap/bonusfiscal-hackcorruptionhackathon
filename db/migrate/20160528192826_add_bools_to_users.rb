class AddBoolsToUsers < ActiveRecord::Migration
   def up
    change_table :users do |t|
      t.boolean :twitter, :default => false
      t.boolean :facebook, :default => false
      t.boolean :instagram, :default => false
    end
  end
 
  def down
    remove_column :users, :twitter
    remove_column :users, :facebook
    remove_column :users, :instagram
  end
end
