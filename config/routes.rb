Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }, skip: [:sessions], controller: { registrations: "user_registrations"}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    match 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
    get 'devise/registrations/confirmation_is_sent'
  end

  resources :products do
    resources :comments
  end
  resources :users

  resources :orders, only: [:index, :show, :create, :destroy]

  get 'simple_pages/landing_page'

  get 'simple_pages/what'

  get 'simple_pages/coaching'

  get 'simple_pages/login'

  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/index'

  root 'simple_pages#landing_page'

  post 'simple_pages/thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
