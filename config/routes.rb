Recipes::Application.routes.draw do
  match '/', {via: :get, to: 'recipes#index'}
  match '/recipes', {via: :get, to: 'recipes#index'}
  match '/recipes', {via: :post, to: 'recipes#create'}
  match '/recipes/:slug', {via: :get, to: 'recipes#show'}
  match '/recipes/:slug', {via: [:put, :patch], to: 'recipes#update'}
  match '/recipes/:slug', {via: :delete, to: 'recipes#destroy'}

  match '/tags', {via: :get, to: 'tags#index'}
  match '/tags', {via: :post, to: 'tags#create'}
  match '/tags/:slug', {via: :get, to: 'tags#show'}
  match '/tags/:slug', {via: [:put, :patch], to: 'tags#update'}
  match '/tags/:slug', {via: :delete, to: 'tags#destroy'}

  match '/recipes/:slug', {via: :post, to: 'ratings#create'}
end
