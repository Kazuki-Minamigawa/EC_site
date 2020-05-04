Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#top"

  resources :items, only: [:top, :index, :show]
  resource :end_users, only: [:show]

  namespace :admin do
    get "/top" => "tops#top"
  end
end
