Rails.application.routes.draw do
  devise_for :items
  get 'items/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'  #この1行を追加
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
  end
end
