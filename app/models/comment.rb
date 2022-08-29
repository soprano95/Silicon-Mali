class Comment < ApplicationRecord
  belongs_to :blog, counter_cache: true
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'


   private

  def notify_recipient
    return if blog.user == user

    CommentNotification.with(comment: self, blog: blog).deliver_later(blog.user)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end

end
