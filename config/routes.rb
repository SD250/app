Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # Routing dla EmployeesController
  get 'employees/reserve', to: 'employees#index', as: 'employees_reserve'
  get 'employees/new', to: 'employees#new', as: 'new_employee_reservation'
  post 'employees', to: 'employees#create'
  get 'employees/:id/edit', to: 'employees#edit', as: 'edit_employee_reservation'
  patch 'employees/:id', to: 'employees#update'
  delete 'employees/:id', to: 'employees#destroy'
  
  # Routing dla AdminController
  get 'admin/desks', to: 'admin#desks', as: 'admin_desks'
  post 'admin/desks', to: 'admin#create'
  get 'admin/desks/:id/edit', to: 'admin#edit', as: 'edit_desk'
  patch 'admin/desks/:id', to: 'admin#update'
  delete 'admin/desks/:id', to: 'admin#delete'

  # Dodatkowe routingi
  get "up" => "rails/health#show", as: :rails_health_check

  # Możesz tu zdefiniować główną ścieżkę, jeśli chcesz
  # root "some_controller#some_action"
end
