Rails.application.routes.draw do
  namespace :admin do
  get 'liquor/new'
  end

  namespace :admin do
  get 'liquor/create'
  end

  namespace :admin do
  get 'liquor/edit'
  end

  namespace :admin do
  get 'liquor/update'
  end

  namespace :admin do
  get 'liquor/destroy'
  end

  namespace :admin do
  get 'liquor/show'
  end

  namespace :admin do
  get 'liquor/index'
  end

  root to: 'about#index'

  get 'about' => 'about#index'
  get 'admin/producer' => 'admin/producer#index'
  get 'admin/supplier' => 'admin/supplier#index'
  get 'admin/liquor' => 'admin/liquor#index'

  get 'admin/producer/new'
  post 'admin/producer/create'
  get 'admin/producer/edit'
  post 'admin/producer/update'
  post 'admin/producer/destroy'
  get 'admin/producer/show'
  get 'admin/producer/show/:id' => 'admin/producer#show'
  get 'admin/producer/index'

  get 'admin/supplier/new'
  post 'admin/supplier/create'
  get 'admin/supplier/edit'
  post 'admin/supplier/update'
  post 'admin/supplier/destroy'
  get 'admin/supplier/show'
  get 'admin/supplier/show/:id' => 'admin/supplier#show'
  get 'admin/supplier/index'

  get 'admin/liquor/new'
  post 'admin/liquor/create'
  get 'admin/liquor/edit'
  post 'admin/liquor/update'
  post 'admin/liquor/destroy'
  get 'admin/liquor/show'
  get 'admin/liquor/show/:id' => 'admin/liquor#show'
  get 'admin/liquor/index'

end
