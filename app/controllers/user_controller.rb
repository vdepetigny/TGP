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
       session[:user_id] = @user.id
       redirect_to root_path
     else
       render :new
       puts @user.errors.messages
    end
  end

  def edit
  end

  def update
  end
end
