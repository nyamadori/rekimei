Rails.application.routes.draw do
  resource :session, only: [:destroy, :new, :create]

  resources :groups, path: '/', param: :slug do
    resources :members
    resources :accounts
  end
end
