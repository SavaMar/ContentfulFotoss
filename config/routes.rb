Rails.application.routes.draw do
  root 'welcome#index'
  get '/:article_id', to: 'articles#show', as: 'article'
  resources :category, only: [:show]
end
