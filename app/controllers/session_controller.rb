class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

	if user && user.authenticate(params[:password])
    log_in(user)    #session[:user_id] = user.id dans session_helper
	  redirect_to root_path
	else
	  flash.now[:danger] = 'Invalid email/password combination'
	  render 'new'
	end

  end
  def destroy
  	session.delete(:user_id)
  	redirect_to root_path
  end
end
