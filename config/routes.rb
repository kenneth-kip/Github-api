Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'dashboard#index'
  get '/autocomplete', to: 'dashboard#autocomplete'
  get '/dashboard/:username/', to: 'dashboard#show'
  get '/callback', to: 'authentication#create'
  get 'login', to: 'authentication#index'
  delete 'signout', to: 'authentication#destroy', as: 'signout'
end
