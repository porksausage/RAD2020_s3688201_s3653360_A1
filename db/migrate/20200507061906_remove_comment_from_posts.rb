class RemoveCommentFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :comment, :text
  end
end
