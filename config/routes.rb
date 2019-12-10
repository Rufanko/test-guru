Rails.application.routes.draw do

  root to: 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :sessions, only: :create
  resources :users, only: :create

  resources :tests do
  	resources :questions, except: :index, shallow: true do
  		resources :answers, except: :index, shallow: true
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
  	member do
  		get :result
  	end
  end

end
