Rails.application.routes.draw do
  resources :user
  get '/' => 'top#top'

  get '/login' => 'user#login_form'
  post 'login' => 'user#login'

end
