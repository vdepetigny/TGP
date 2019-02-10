class UserController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], password: params[:password], city: City.all.sample)
    
     if @user.save
       flash[:notice] = "Vous Vous êtes bien enregistré(e)!"
       log_in(@user) #session[:user_id] = user.id dans session_helper
       redirect_to root_path
     else
      flash.now[:danger] = 'Il manque des informations...'
      render 'new'      
    end
  end

  def edit
  end

  def update
  end
end
