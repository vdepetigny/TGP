class CommentController < ApplicationController
before_action :authenticate_user, only: [:create, :edit, :destroy]

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
  @comment = Comment.create(content: params[:content], user: current_user , gossip_id: params[:gossip_id]) # current_user = User.find_by(id: session[:user_id]) dans session_helper
  redirect_to gossip_path(params[:gossip_id])
 end

 def edit
   @comment = Comment.find(params[:id])
 end

 def update
  @comment = Comment.find(params[:id])
puts "*"*70
  puts params 
    if @comment.update(content: params[:content], user: current_user , gossip_id: params[:gossip_id])
      flash[:notice] = "Vous avez mis-à-jour un potin avec succès"    
      redirect_to root_path
    else
      render 'edit'
    end
 end

 def destroy
 end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
