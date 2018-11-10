Rails.application.routes.draw do
  resources :user
  get '/' => 'top#top'
end
