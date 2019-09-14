Rails.application.routes.draw do
  resources :mypages
  resources :logout

  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'mypages#identification'
end
