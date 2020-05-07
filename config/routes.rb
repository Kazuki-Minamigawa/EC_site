Rails.application.routes.draw do
  resource :end_users, only: [:show, :edit, :update]
    get "/end_users/edit/unsubscribe" => "end_users#unsubscribe"
    patch "/end_users/hide" => "end_users#hide"
    put "/end_users/hide" => "end_users#hide"

  devise_for :admins
  devise_for :end_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#top"

  resources :items, only: [:top, :index, :show]

  namespace :admin do
    get "/top" => "tops#top"
    resources :end_users, only: [:index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show]
  end
end
