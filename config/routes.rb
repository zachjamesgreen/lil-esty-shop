Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'merchant#index'

  get '/items/:id', to: 'merchants/items#show'
  get '/invoices/:id', to: 'merchants/invoices#show'
  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :merchants, only: [:index, :show]
    resources :invoices, only: [:index, :show]
  end

  namespace :merchants do
    get '/:id/dashboard', to: 'dashboard#index'
    get '/:id/items', to: 'items#index'
    get '/:id/items/:item_id', to: 'items#show'
    get '/:id/invoices', to: 'invoices#index'
    get '/:id/invoices/:invoice_id', to: 'invoices#show'
    get '/:id/items/:item_id/edit', to: 'items#edit'
    patch '/:id/items/:item_id', to: 'items#update'
  end
end
