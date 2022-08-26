class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  has_rich_text :body
end
