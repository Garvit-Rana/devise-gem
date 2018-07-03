Rails.application.routes.draw do
  resources :posts
  devise_for :users
 
get 'like/:post_id',to: 'likes#like',as: :like
 post 'comment/create',to: 'comments#create', as: :comments
delete 'comment/:id', to:'comments#destroy', as: :delete 
delete 'dislike/:post_id', to: 'likes#destroy', as: :delete2
 root 'posts#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
