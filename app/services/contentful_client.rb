class ContentfulClient
  def self.get_categories
    self.client.entries(
      content_type: "category",
      "fields.availableOn[in]" => ["infotoss.com"]
    )
  end

  def self.get_articles(category_id, page)
    self.client.entries(
      content_type: "article",
      "fields.categories.sys.id[in]" => category_id,
      "fields.availableOn[in]" => ["infotoss.com"],
      limit: 8,
      skip: (page.to_i - 1) * 8
    )
  end

  def self.get_article(article_title)
    self.client.entries(
      content_type: "article",
      "fields.title[in]" => article_title
    ).first
  end

  private

  def self.client
    Contentful::Client.new(
      access_token: Rails.application.secrets[:access_token],
      space: Rails.application.secrets[:space],
      dynamic_entries: :auto,
      raise_errors: true,
      max_include_resolution_depth: 4
    )
  end
end
