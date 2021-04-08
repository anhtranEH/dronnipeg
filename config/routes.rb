Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home
  resources :products
  resources :categories
  resources :orders
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create", default: { format: :js }
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
end
