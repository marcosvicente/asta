class App::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def index 
    @users = User.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @import = Import.where(user_id: @user.id).last(5)
  end

  def new
    @user = User.new
  end
   
  def edit
  end

  def create
    @user = User.new(user_new_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to app_users_path, notice: I18n.t('controller.user.work.new') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: I18n.t('controller.user.error.new')}
        format.json { render json: @user.errors, status: :unprocessable_entity   }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_update_params)
        format.html { redirect_to app_user_path, notice: I18n.t('controller.user.work.update') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status:  I18n.t('controller.user.error.update')}
        format.json { render json: @user.errors, status: :unprocessable_entity  }
      end
    end
  end

  private
    def user_new_params
      params.require(:user).permit(:email, :kind, :password, :password_confirmation)
    end

    def user_update_params
      params.require(:user).permit(:kind)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
