Rails.application.routes.draw do

  #get 'test_passages/show'
  #get 'test_passages/update'
  root to: 'tests#index'


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
