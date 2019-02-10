class SessionController < ApplicationController
  
  def create
    user = User.find_by(email: params[:email])

	if user && user.authenticate(params[:password])
    log_in(user) #cf. session_helper
    remember user #cf. session_helper
	  redirect_to root_path
	else
	  flash.now[:danger] = 'Email et/ou password non valide'
	  render 'new'
	end

  end
  def destroy
  	session.delete(:user_id) #cf. session_helper
  	redirect_to root_path
  end
end
