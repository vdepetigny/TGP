class GossipController < ApplicationController
  
  def index
    @all_gossip = Gossip.all
  end

  def show
    @all_gossip = Gossip.all
    @gossip_number = params["id"]
    @gossip_identity = @all_gossip[params["id"].to_i]
  end

  def new
  @gossip = Gossip.new
  end

  def create    
    @gossip = Gossip.new(content: params[:content], title: params[:title], user_id: 2)
    
    if @gossip.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end
end
