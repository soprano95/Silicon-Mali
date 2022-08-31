class AddCategoryToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :blogs, :category, null: false, foreign_key: true
  end
end
