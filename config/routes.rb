Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/interpreters" => "interpreter#index"
  get "/interpreters/new" => "interpreter#new"
  get "/interpreters/:id" => "interpreter#show"
  get "/interpreters/:id/edit" => "interpreter#edit"
  post "/interpreters" => "interpreter#create"
  patch "/interpreters/:id" => "interpreter#update"
  delete "/interpreters/:id" => "interpreter#destroy"

  get "/scene_shops" => "scene_shop#index"
  get "/scene_shops/new" => "scene_shop#new"
  get "/scene_shops/:id" => "scene_shop#show"
  get "/scene_shops/:id/edit" => "scene_shop#edit"
  post "/scene_shops" => "scene_shop#create"
  patch "/scene_shops/:id" => "scene_shop#update"
  delete "/scene_shops/:id" => "scene_shop#destroy"

  resources :rehearsal_spaces
  resources :lighting_vendors
end
