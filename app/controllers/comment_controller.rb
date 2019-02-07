class CommentController < ApplicationController

 def show
 #@gossip = Gossip.find(params[:id])
 #@comments = @gossip.comments
 end

 def index
 #@gossip = Gossip.find(params[:id])
 #@comments = @gossip.comments
 end

 def new
 #@gossip = Gossip.find(params[:id])
 #@comment = @gossip.comment.new
 end

 def create
  @comment = Comment.create(content: params[:content], user_id: User.all.sample.id , gossip_id: params[:gossip_id])
  redirect_to gossip_path(params[:gossip_id])
 end

 def edit
   @comment = Comment.find(params[:id])
 end

 def update
  @comment = Comment.find(params[:id])
puts "*"*70
  puts params 
    if @comment.update(content: params[:content], user_id: User.all.sample.id , gossip_id: params[:gossip_id])
      flash[:notice] = "Vous avez mis-à-jour un potin avec succès"    
      redirect_to root_path
    else
      render 'edit'
    end
 end

 def destroy
 end

end
