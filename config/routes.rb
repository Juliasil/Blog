Rails.application.routes.draw do
  devise_for :users

  resources :blog_posts do
    collection do
      get :search
    end
  end
  resources :comments, only: %i[create]

  root "blog_posts#index"
end
