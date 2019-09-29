Rails.application.routes.draw do
  resources :libraries
  resources :universities
  devise_for :students, controllers: {
      registrations: 'students/registrations'
  }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
