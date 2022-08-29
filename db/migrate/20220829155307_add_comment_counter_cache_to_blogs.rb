class AddCommentCounterCacheToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :comments_count, :integer
  end
end
