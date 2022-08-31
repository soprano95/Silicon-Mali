class UsersController < ApplicationController
  before_action :set_user
  def profile
     @user.update(views: @user.views + 1)
      @blogs = @user.blogs.includes(:rich_text_body).order(created_at: :desc)
      @total_views = 0

    @blogs.each do |blog|
      @total_views += blog.views
    end
  end

  private
   def set_user
    @user = User.find(params[:id])
  end
end
