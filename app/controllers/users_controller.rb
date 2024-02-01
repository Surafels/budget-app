class UsersController < ApplicationController
  # GET /users or /users.json
  def index; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def authenticate_and_set_user
    authenticate_user!
    set_user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
