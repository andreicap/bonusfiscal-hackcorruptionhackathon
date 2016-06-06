class AddIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :f_id, :string
  end
end
