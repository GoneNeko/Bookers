Rails.application.routes.draw do
  devise_scope :social_account do
    get 'sign_out', to: "sessions#destroy"
  end

  devise_for :users
  root "top#index"
  resources :books
  resources :users
  get "home/about" => "user#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
