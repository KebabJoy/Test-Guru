Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'
  get '/tests/:test_id/questions/:question_id', to: 'questions#show'

  resources :tests do
    resources :questions, shallow: true
  end
end
