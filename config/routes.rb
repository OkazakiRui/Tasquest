Rails.application.routes.draw do
  resources :tasks do
    member do
      post 'start', action: 'start'
      post 'finish', action: 'finish'
      post 'failure', action: 'failure'
    end
    collection do
      get 'start', action: 'started_tasks'
      get 'finish', action: 'finished_tasks'
      get 'failure', action: 'failed_tasks'
    end
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

# devise_scope :user do
#   get 'login' => 'devise/sessions#new', as: :new_user_session
#   post 'login' => 'devise/sessions#create', as: :user_session
#   delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
#   get 'google_oauth2' => 'users/omniauth_callbacks#passthru'
#   post 'google_oauth2' => 'users/omniauth_callbacks#passthru'
#   get 'google_oauth2_callback' => 'users/omniauth_callbacks#google_oauth2'
#   post 'google_oauth2_callback' => 'users/omniauth_callbacks#google_oauth2'
# end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '/ranking', to: 'home#ranking'
  get '/mypage', to: 'home#mypage'
  get '/settings', to: 'home#settings'
end