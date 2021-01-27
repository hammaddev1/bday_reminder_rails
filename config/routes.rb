Rails.application.routes.draw do
  require 'sidekiq/web'

  devise_for :users
  root to: 'user#show'
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
    get'sign_up', to: 'devise/registrations#new'
  end

  resources :birthday_events
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
