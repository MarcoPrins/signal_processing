Rails.application.routes.draw do
  resources :data_captures, only: :show
  resources :data_analyses, only: [:create]
  get '/data_analyses/preview', to: 'data_analyses#preview'
end
