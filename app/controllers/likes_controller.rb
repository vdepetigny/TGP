class LikesController < ApplicationController
before_action :authenticate_user, only: [:new, :edit, :destroy]
before_action :find_gossip
before_action :find_like, only: [:destroy]

  def create
      if already_liked?
        flash[:notice] = "Tu ne peux pas liker plus d'une fois"
      else
       flash[:notice] = "Tu as liké comme un bosse!" 
       @gossip.likes.create(user_id: current_user.id)
       redirect_to gossip_path(params[:gossip_id])
      end
  end

   def destroy
     if !(already_liked?)
       flash[:notice] = "Tu ne peux pas enlever des coeurs comme ça..."
     else
       @like.destroy
       flash[:danger] = "Like pulvérisé"
   	end
   	  redirect_to gossip_path(params[:gossip_id])
   end

  private

  def find_gossip	
    @gossip = Gossip.find(params[:gossip_id])
  end

  def already_liked?
  Like.where(user_id: current_user.id, gossip_id:
  params[:gossip_id]).exists?
  end


   def find_like
    @like = @gossip.likes.find(params[:id])
   end
end
