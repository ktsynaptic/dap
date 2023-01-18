Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'welcome#index'

  post '/csv_import', to: 'csv#import'
  get '/file/:id', to: 'file#show'
  get '/template', to: 'csv#template'
end
