class GossipController < ApplicationController
  
  def index
    @all_gossip = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create    
    @gossip = Gossip.new(content: params[:content], title: params[:title], user_id: User.all.sample.id)
    
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
    
    if @gossip.update(content: post_params[:content], title: post_params[:title], user_id: params[:id])
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

end
