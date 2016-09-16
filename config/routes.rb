Rails.application.routes.draw do
  get '/:short', to: 'links#show'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end
end
