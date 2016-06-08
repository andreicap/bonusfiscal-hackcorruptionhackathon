class AddCommentsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments, :string
    add_column :posts, :sentiments, :string
  end
end
