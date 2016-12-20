Rails.application.routes.draw do
  resource :session, only: [:destroy, :new, :create]

  resources :groups, path: '/', param: :slug, except: [:index] do
    resource :invitation, only: [:new, :create]
    resources :accounts
  end
end
