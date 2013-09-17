Scrapy::Application.routes.draw do
  resources :results, only: [:index]
  get "static/index"

  root to: 'static#index'
end
