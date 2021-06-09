Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'admin/dashboard#index'
  patch '/invoice_items/:invoice_item_id/:status', to: 'invoice_items#update', as: "invoice_item_patch"
  get '/items/:id', to: 'merchants/items#show'
  get '/invoices/:id', to: 'merchants/invoices#show'
  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :merchants, only: [:index, :show, :edit, :update, :create]
    post '/merchants/:id/enabled', to: 'merchants#enabled'
    resources :invoices, only: [:index, :show, :update]
  end

  namespace :merchants do
    get '/:id/dashboard', to: 'dashboard#index'

    get '/:id/invoices', to: 'invoices#index'
    get '/:id/invoices/:invoice_id', to: 'invoices#show', as: 'merch_invoice'
    patch '/:id/invoice_items/:invoice_item_id', to: 'invoices#show', as: 'patch_invoice_item'

    get '/:id/items', to: 'items#index'
    get '/:id/items/:item_id/edit', to: 'items#edit'
    patch '/:id/items/:item_id', to: 'items#update'
    post '/:id/items', to: 'items#create'
  end
end
