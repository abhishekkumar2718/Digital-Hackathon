class User::UsersController < ApplicationController
  before_action :set_user_user, only: [:show, :edit, :update, :destroy]

  # GET /user/users
  # GET /user/users.json
  def index
    @user_users = User::User.all
  end

  # GET /user/users/1
  # GET /user/users/1.json
  def show
  end

  # GET /user/users/new
  def new
    @user_user = User::User.new
  end

  # GET /user/users/1/edit
  def edit
  end

  # POST /user/users
  # POST /user/users.json
  def create
    @user_user = User::User.new(user_user_params)

    respond_to do |format|
      if @user_user.save
        format.html { redirect_to @user_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user_user }
      else
        format.html { render :new }
        format.json { render json: @user_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/users/1
  # PATCH/PUT /user/users/1.json
  def update
    respond_to do |format|
      if @user_user.update(user_user_params)
        format.html { redirect_to @user_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_user }
      else
        format.html { render :edit }
        format.json { render json: @user_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/users/1
  # DELETE /user/users/1.json
  def destroy
    @user_user.destroy
    respond_to do |format|
      format.html { redirect_to user_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_user
      @user_user = User::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_user_params
      params.require(:user_user).permit(:username, :password, :password_confirmation)
    end
end
