class CategoryController < ApplicationController
  def show
    articles = ContentfulClient::get_articles(params[:id], params[:page] || 1)
    @articles = Kaminari.paginate_array(articles.to_a, total_count: articles.total).page(params[:page]).per(8)
  end
end
