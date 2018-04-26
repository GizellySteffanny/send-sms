class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    SendPinJob.perform_now(@user)

    if @user.save
      # auto_login(@user)
      redirect_to new_verify_url
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:phone, :pin, :pint_sent_at)
    end
end
