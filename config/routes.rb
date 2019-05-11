Rails.application.routes.draw do
  root 'centrals#index'
  get 'show_all', to: 'main_display#index'
  devise_for :users
  resources :centrals do
  	resources :beacons
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
