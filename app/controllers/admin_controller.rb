class AdminController < ApplicationController
  before_action :authenticate_user!
  # Akcja wyświetlania listy biurek
  def desks
    @desks = Desk.all
  end

  # Akcja tworzenia nowego biurka (POST request)
  def create
    @desk = Desk.new(desk_params)
    if @desk.save
      redirect_to admin_desks_path, notice: 'Desk was successfully created.'
    else
      render :new
    end
  end

  # Akcja edycji istniejącego biurka (GET request)
  def edit
    @desk = Desk.find(params[:id])
  end

  # Akcja aktualizacji biurka (PATCH/PUT request)
  def update
    @desk = Desk.find(params[:id])
    if @desk.update(desk_params)
      redirect_to admin_desks_path, notice:
    end
  end

  # Akcja usuwania biurka (DELETE request)
 def delete
   @desk = Desk.find(params[:id])
   @desk.destroy
   redirect_to admin_desks_path, notice: 'Desk was successfully deleted.'
 end

 private

 def desk_params
   params.require(:desk).permit(:name, :location, :status)
 end
end
