class SessionsController < ApplicationController
  helper_method :logged_in?

  def new
    redirect_to user_path(current_user), notice: 'Jesteś już zalogowany.' if logged_in?
  end

  def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    redirect_to user_path(user), notice: 'Zalogowano pomyślnie.'
  else
    flash.now[:alert] = 'Nieprawidłowy e-mail lub hasło'
    render :new
  end
end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url, notice: 'Wylogowano pomyślnie.'
  end
end