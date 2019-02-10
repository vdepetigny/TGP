class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], password: params[:password], city: City.all.sample)
    
    #Verify if you have all the informations
     if @user.save # cf. user.rb >> model validations
       flash[:notice] = "Vous Vous êtes bien enregistré(e)!"
       log_in(@user) #cf. session_helper
       redirect_to root_path
     else
      flash.now[:danger] = 'Il manque des informations...'
      render 'new'      
    end
  end

end
