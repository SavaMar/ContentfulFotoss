class WelcomeController < ApplicationController
  def index
    @categories = ContentfulClient::get_categories
  end
end
