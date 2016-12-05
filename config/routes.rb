Rails.application.routes.draw do
  resources :groups, path: '/', param: :slug do
    resources :members do
      resource :session, only: [:destroy, :new, :create]
    end
  end
end
