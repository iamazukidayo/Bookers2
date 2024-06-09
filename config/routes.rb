Rails.application.routes.draw do


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#top"
  devise_for :users, controllers: { registrations: 'registrations' }
  get "/home/about" => "home#about", as:"about"
  # devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :index, :update]
  # get "/home/about" => "home#about", as:"about"

end
