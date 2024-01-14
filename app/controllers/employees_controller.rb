class EmployeesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # Wyświetlanie listy dostępnych biurek do rezerwacji (GET request)
  def index
    @desks = Desk.all
  end

  # Formularz do tworzenia nowej rezerwacji (GET request)
  def new
    @reservation = Reservation.new
  end

  # Tworzenie nowej rezerwacji biurka (POST request)
  def create
    @reservation = Reservation.new(reservation_params)
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
    params.require(:reservation).permit(:desk_id, :user_id, :start_date, :end_date, :status)
  end
end
