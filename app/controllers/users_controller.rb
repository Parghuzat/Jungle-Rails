class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root
    else
      redirect_to '/login', notice: "Something went wrong, please try again!"
    end
  end


  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end