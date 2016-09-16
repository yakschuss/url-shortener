Rails.application.routes.draw do
  get '/:short', to: 'links#show'

  namespace :api do
    namespace :v1 do
      get 'counter/:url', to: 'links#counter'
      resources :links, only: [:create]
    end
  end
end
