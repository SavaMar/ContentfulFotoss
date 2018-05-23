class ArticlesController < ApplicationController
  def show
    @article = ContentfulClient::get_article(params[:article_id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @article_content = markdown.render(@article.content)
  end
end