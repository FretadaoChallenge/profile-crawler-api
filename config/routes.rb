Rails.application.routes.draw do
  resources :members
  get '/search', to: 'searches#search_member', as: 'search'
  get '/:id', to: 'shortener/shortened_urls#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
