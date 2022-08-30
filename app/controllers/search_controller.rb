class SearchController < ApplicationController
  def index
    @query = Blog.includes(:user, :rich_text_body).ransack(params[:q])
    @blogs = @query.result(distinct: true)
  end
end
