class GossipController < ApplicationController
before_action :authenticate_user, only: [:new, :edit, :destroy]

  def index
    @all_gossip = Gossip.all
    @all_gossip
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    
    @gossip = Gossip.new(content: params[:content], title: params[:title], user: current_user) # current_user = User.find_by(id: session[:user_id]) dans session_helper
    
    if @gossip.save
      flash[:notice] = "Vous avez crée un potin avec succès"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params[:gossip]
    
    if @gossip.update(content: post_params[:content], title: post_params[:title], user: current_user) # ou mettre params[:id] pour de garder le même auteur au choix...  current_user = User.find_by(id: session[:user_id]) dans session_helper
      flash[:notice] = "Vous avez mis-à-jour un potin avec succès"    
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy

    flash[:notice] = "Vous avez supprimé un potin avec succès"
    redirect_to root_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
