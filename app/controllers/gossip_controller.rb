class GossipController < ApplicationController
  
  def index
    @all_gossip = Gossip.all
  end

  def show
    puts "@"*30
    @all_gossip = Gossip.all
    @gossip_number = params["id"]
    @gossip_identity = @all_gossip[params["id"].to_i]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
