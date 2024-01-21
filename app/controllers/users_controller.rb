class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Logowanie użytkownika po rejestracji
      redirect_to user_path(@user), notice: 'Rejestracja zakończona pomyślnie.'
    else
      render :new
    end
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/:id/edit
  def edit
    # set_user jest używany
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Profil zaktualizowany pomyślnie.'
    else
      render :edit
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to root_url, notice: 'Profil usunięty pomyślnie.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def require_login
    redirect_to login_path, alert: 'Musisz być zalogowany.' unless logged_in?
  end

  def correct_user
    redirect_to(root_url, alert: "Nie masz uprawnień do tej operacji.") unless @user == current_user
  end

  def check_if_admin
    if current_user.admin?
    end
  end
end

