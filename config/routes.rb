Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
  get 'admin/products', to: "products#index", as: :products

  get 'admin/products/:id', to: "products#show", as: :product

  get 'admin/products/:id/edit', to: "products#edit", as: :edit_product

  patch 'admin/products/:id', to: "products#update"
 
  #get 'posts', to: "posts#index"

  namespace 'api' do
  	namespace 'v1' do
  		resources :products
  	end
  end
end
