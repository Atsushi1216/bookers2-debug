Rails.application.routes.draw do
devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search' => 'searchs#search'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

end