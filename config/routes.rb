Rails.application.routes.draw do
  get 'users/facebook'

  get 'recommendations/pages'

  root to: 'cards#show'

  resources 'cards', only: [:show]

  get 'save_result', to: 'recommendations#save_to_recommendation'

  get 'start', to: 'cards#start' #clears the cookies

  get 'swipe', to: 'cards#swipe'

  get 'dashboard', to: 'pages#dashboard'

  get 'results', to: 'recommendations#show', as: 'results'

  get '/results/:id', to: 'recommendations#existing', as: 'existing'

  delete '/results/:id', to: 'recommendations#destroy', as: 'destroy'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
