class SessionController < ApplicationController
  def new
  end

  def create
  	puts "*"*70
  	puts params
  	puts params[:email]
  	puts params[:password]

    
    user = User.find_by(email: params[:email])
    
    puts "*"*70
    puts user.first_name
    puts user.email
    puts user.authenticate(params[:password])
   	puts "*"*70  

	if user && user.authenticate(params[:password])
	  session[:user_id] = user.id
	  puts "YES"
	  redirect_to root_path
	else
	  flash.now[:danger] = 'Invalid email/password combination'
	  render 'new'
	end

  end

  def destroy
  end

end
