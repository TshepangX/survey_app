Rails.application.routes.draw do
  devise_for :users
  root "surveys#index"

  
  resources :users
  resources :answers
  resources :surveys do
    resources :questions
    get :report
  end
end
