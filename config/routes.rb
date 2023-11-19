Rails.application.routes.draw do
  devise_for :users

  resources :blog_posts do
    get :search, on: :collection
  end
  resources :comments, only: %i[create]

  root "blog_posts#index"
end
