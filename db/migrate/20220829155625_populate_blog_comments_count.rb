class PopulateBlogCommentsCount < ActiveRecord::Migration[7.0]
   def change
    Blog.all.each do |blog|
      Blog.reset_counters(blog.id, :comments)
    end
  end
end
