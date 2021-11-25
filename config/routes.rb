Rails.application.routes.draw do

  resources :weathers
  root 'weathers#index'
  delete 'erase', to: 'weathers#erase'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
