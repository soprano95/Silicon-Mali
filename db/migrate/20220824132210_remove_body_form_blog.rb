class RemoveBodyFormBlog < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :body, :text
  end
end
