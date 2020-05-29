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
    delete "/cart_items" => "cart_items#destroy_all"

  resources :cart_items, only: [:index, :update, :destroy]
    post "/cart_items/create" => "cart_items#create"

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  resources :orders, only: [:new, :index, :show]
    post "/orders/check" => "orders#check"
    get "/orders/check/thanks" => "orders#thanks"
    post "/orders/check/thanks" => "orders#create"



  namespace :admin do
    get "/top" => "tops#top"
    resources :end_users, only: [:index, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show]
    resources :orders, only: [:index, :update, :show]
    resources :order_details, only: [:update]
  end

end
