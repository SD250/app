Rails.application.routes.draw do
  # Routing dla EmployeesController
  get 'employees/reserve', to: 'employees#index', as: 'employees_reserve'
  get 'employees/new', to: 'employees#new', as: 'new_reservation'
  post 'employees', to: 'employees#create'
  get 'employees/:id/edit', to: 'employees#edit', as: 'edit_reservation'
  patch 'employees/:id', to: 'employees#update'
  delete 'employees/:id', to: 'employees#destroy'

  # Routing dla AdminController
  get 'admin/desks', to: 'admin#desks', as: 'admin_desks'
  post 'admin', to: 'admin#create'
  get 'admin/:id/edit', to: 'admin#edit', as: 'edit_desk'
  patch 'admin/:id', to: 'admin#update'
  delete 'admin/:id', to: 'admin#delete', as: 'delete_desk'

  # Dodatkowe routingi
  get "up" => "rails/health#show", as: :rails_health_check

  # Możesz tu zdefiniować główną ścieżkę, jeśli chcesz
  # root "some_controller#some_action"
end