class EmployeesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def reserve
    @desks = Desk.all
  end

  def reserve_desk
    desk = Desk.find(params[:id])
    desk.update(status: 'zajęte')

    redirect_to employees_reserve_path, notice: 'Desk reserved successfully.'
  end

  # Formularz do tworzenia nowej rezerwacji (GET request)
  def new
    @reservation = Reservation.new
  end

  # Tworzenie nowej rezerwacji biurka (POST request)
  def create
    @reservation = Reservation.new(reservation_params.merge(user_id: current_user.id))
    if @reservation.save
      redirect_to employees_reserve_path, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  # Edytowanie istniejącej rezerwacji (GET request)
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # Aktualizacja istniejącej rezerwacji (PATCH/PUT request)
  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to employees_reserve_path, notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  # Anulowanie rezerwacji (DELETE request)
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to employees_reserve_path, notice: 'Reservation was successfully cancelled.'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:desk_id, :start_date, :end_date, :status)
  end

  def require_login
    unless logged_in?
      flash[:alert] = "Musisz być zalogowany, aby wykonać tę akcję."
      redirect_to login_path
    end
  end
end
