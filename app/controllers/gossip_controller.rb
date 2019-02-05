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
  end

  def create
    # puts "$" * 60
    # puts "dans le Create ceci est le contenu de params :"
    # puts params[:content]
    # puts params[:title]
    # puts "$" * 60    
    @gossip = Gossip.new('content' => params[:content], 'title' => params[:title], 'user_id' => 2)
    @gossip.save

  end

  def edit
  end

  def update
  end
end
