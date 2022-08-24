class SearchController < ApplicationController
  def index
    @query = Blog.includes(:user).ransack(params[:q])
    @blogs = @query.result(distinct: true)
  end
end
