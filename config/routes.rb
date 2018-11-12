Rails.application.routes.draw do

  resources :user,:post
  get '/' => 'top#top'

  get '/login' => 'user#login_form'
  post '/login' => 'user#login'
  get '/logout' => 'user#logout'
end
