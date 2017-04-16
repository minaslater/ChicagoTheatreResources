Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :interpreters
  resources :scene_shops
  resources :rehearsal_spaces
  resources :lighting_vendors
end
