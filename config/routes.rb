Rails.application.routes.draw do
  root "application#home_page"

  get 'baskets/next_basket'
  get 'application/home_page'
  get '/sessions/sign_in/:id', to: 'sessions#sign_in', as: 'session_sign_in'
  get '/sessions/destroy', to: 'sessions#destroy', as: 'session_destroy'
  get '/admin', to: 'customers#login_admin', as: 'customer_login_admin'
  post "login_admin", to: "sessions#sign_in_admin"
  post "baskets/new_order", to: "baskets#new_order", as: 'new_order_basket'
  get '/customers/orders', to: 'customers#orders', as: 'orders_customer'
  get '/customers/admin_index', to: 'customers#admin_index', as: 'admin_index_customer'
  
  resources :customers
  resources :baskets


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
end