Rails.application.routes.draw do
  resources :badges, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'
  get '/admin' => 'admin/tests#index', as: :admin_root

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'sessions'}

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    resources :gists, only: :create
    member do
      get :result
    end
  end

  namespace :admin do
    resources :badges, shallow: true
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index]
  end
end
