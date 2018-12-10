class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
<<<<<<< HEAD
    p user_signed_in?
    @users = User.all
    render json: @users
=======
   if  @user.admin?
      @users = User.all
      render json: @users
   else
     render json: status: :unauthorized
   end  
>>>>>>> 880a820622fda40ecca89b5832df0d0373e3e54a
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.admin?
       @user.update(user_params)
       render json: @user
    else
      render json: status: :unauthorized
    end
  end
  

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:fname, :lname, :role)
    end
end