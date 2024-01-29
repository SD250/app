Rails.application.routes.draw do
  root 'sessions#new'
  
  # Routing dla sesji
get 'login', to: 'sessions#new', as: 'login'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy', as: 'logout'  # Zaktualizowane na DELETE

  # Routing dla rejestracji użytkowników
  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :employees, only: [:new, :edit, :update] do
    get 'reserve', on: :collection
    patch 'reserve_desk/:id', to: 'employees#reserve_desk', as: 'reserve_desk'
  end

  patch 'reserve_desk/:id', to: 'employees#reserve', as: 'reserve_desk'
  get 'reserve_desk/:id', to: 'employees#reserve_desk', as: 'reserve_desk_form'

  # Routing dla EmployeesController
  get 'employees/reserve', to: 'employees#index', as: 'employees_reserve'
  get 'employees/new', to: 'employees#new', as: 'new_employee_reservation'
  post 'employees', to: 'employees#create'
  get 'employees/:id/edit', to: 'employees#edit', as: 'edit_employee_reservation'
  patch 'employees/:id', to: 'employees#update'
  delete 'employees/:id', to: 'employees#destroy'

  # Routing dla AdminController
  get 'admin/desks/new', to: 'admin#new_desk', as: 'new_desk'
  get 'admin/desks', to: 'admin#desks', as: 'admin_desks'
  post 'admin/desks', to: 'admin#create'
  get 'admin/desks/:id/edit', to: 'admin#edit', as: 'edit_desk'
  patch 'admin/desks/:id', to: 'admin#update', as: 'update_desk'
  delete 'admin/desks/:id', to: 'admin#delete'
  delete 'admin/desks/:id', to: 'admin#destroy_desk', as: 'destroy_desk'

  # Dodatkowe routingi
  get "up" => "rails/health#show", as: :rails_health_check

  # Możesz tu zdefiniować główną ścieżkę, jeśli chcesz
  # root "some_controller#some_action"
end