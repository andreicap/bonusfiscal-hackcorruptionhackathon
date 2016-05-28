class AddColumnsToAuthentications < ActiveRecord::Migration
  def change
      add_column :authentications, :token, :string
      add_column :authentications, :name, :string
      add_column :authentications, :email, :string
  end
end
