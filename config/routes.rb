Rails.application.routes.draw do
  get 'autos/listadoDeAutos'

  devise_scope :admin do
    get 'admins/editSupervisor/:id', to: 'admins/registrations#editSupervisor', as: 'editSupervisor'
  end

  devise_scope :admin do
    put 'admins/updateSupervisor/:id', to: 'admins/registrations#updateSupervisor', as: 'updateSupervisor'
  end

  devise_scope :admin do
    delete 'admins/deleteSupervisor/:id', to: 'admins/registrations#deleteSupervisor', as: 'deleteSupervisor'
  end

  resources :autos, only: [:new, :create, :edit, :update]
  # devise_for :supervisors, controllers: {
  #   sessions: 'supervisors/sessions'
  # }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users
  resources :admins, only: [:index]


  as :admin do
    get 'admins', :to => 'admins#index', :as => :admins_root # Rails 3
  end

  as :user do
    get 'users', :to => 'users#index', :as => :users_root # Rails 3
  end

  # get "admins/edit/:id", to: "admins/registrations#edit"
  # put "admins/edit/:id", to: "admins/registrations#update"


  get '/admins/listar_usuarios', :to => 'admins#listar_usuarios'
  get '/admins/listar_supervisores', :to => 'admins#listar_supervisores'

  root "main#home"
  match "*path" => redirect("/"), via: [:get, :post]
end
