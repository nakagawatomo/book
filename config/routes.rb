Rails.application.routes.draw do
  get 'lists/index'
  get '/top' => 'homes#top'
  post 'lists' => 'lists#create'
  get '/index' => 'lists#index'
  get 'lists/show'
  get 'lists/:id' => 'lists#show', as: 'list'
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  patch 'lists/:id' => 'lists#update', as: 'update_list'
  delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'
end
