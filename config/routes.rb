Rails.application.routes.draw do
  devise_for :admins,
  path: 'admin',
  path_names:
  {
    sign_in: ''
  }

  resources :games
  root :to => "games#index"
end
