class SessionsController < ApplicationController 
  
  def new
    render :new
  end

  def create
    email = params[:user][:email]
    password =  params[:user][:password]
    user = User.find_by_credentials(email, password)
    if user
      login_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    logout_user!
    render :new
  end

  private
  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end 