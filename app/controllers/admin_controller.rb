class AdminController < ApplicationController
  def index
  end

  def blogs
    @blogs = Blog.all.includes(:user)
  end

  def comments
  end

  def users
  end

  def show_blog
     @blog = Blog.includes(:user, comments: [:user, :rich_text_body]).find(params[:id])
  end
end
