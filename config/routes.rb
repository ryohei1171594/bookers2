Rails.application.routes.draw do
  get 'books/edit'
  devise_for :users
  get 'users' => "users#index"
  root to: "homes#top"
  get 'home/about' => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :destroy]
  get 'books/destroy'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :users, only: [:show, :edit, :update]
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
end
