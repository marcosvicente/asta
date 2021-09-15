class App::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def index 
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
   
  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to app_users_path, notice: "Usuario foi criado." }
        format.json { render :show, status: :created, location: @import }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Usuario was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
