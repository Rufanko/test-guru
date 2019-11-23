Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 	
 get 'tests/:test_id/questions/:id/destroy' => 'questions#destroy'

  resources :tests do
  	resources :questions, shallow: true
  end


end
