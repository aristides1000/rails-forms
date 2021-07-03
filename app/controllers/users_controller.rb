class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    respond_to do | format |
      if @user.update(user_params)
        format.html{redirect_to @user, notice: "User Updated"}
      else
        format.html{render :edit, notice: "#{@user.errors.full_messages.to_sentence}"}
      end
    end
  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
