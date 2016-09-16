Rails.application.routes.draw do
  get '/:short', to: 'links#show'
end
