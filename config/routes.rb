Rails.application.routes.draw do
  resources :bloggers
  resources :destinations 
  resources :posts
  patch '/posts/:id/add_like', to: "posts#add_like", as: 'like_post'
end
