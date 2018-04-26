Rails.application.routes.draw do
  get "/verify" => 'verify#new', as: 'new_verify'
  put "/verify" => 'verify#update', as: 'verify'
  post "/verify" => 'verify#create', as: 'resend_verify'

  resources :users
end
