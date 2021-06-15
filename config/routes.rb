Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home
  resources :products do
    collection do
      get "search"
    end
  end
  resources :categories
  resources :orders
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  resources :cart, only: %i[create index update] do
    collection do
      post "update_cart"
    end
  end
end
