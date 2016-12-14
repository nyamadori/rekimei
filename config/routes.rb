Rails.application.routes.draw do
  resource :session, only: [:destroy, :new, :create]

  resources :groups, path: '/', param: :slug, except: [:index] do
    resources :members do
      resource :account
    end

    resource :invitation, only: [:new, :create]
  end
end
