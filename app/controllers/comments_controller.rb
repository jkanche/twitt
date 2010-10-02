class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    
    @comment = @post.comments.create!(params[:comment])
    @comment.update_attribute(:user_id,User.find_by_id(session[:user_id]).id)
    redirect_to @post
  end

  def commentscheer
    @comment = Comment.find(params[:id])
    @comment.update_attribute(:cheer,@comment.cheer.succ )
     redirect_to @comment.post_id
   # respond_to do |format|
    #  format.html {redirect_to(show_url)}
     # format.xml  { render :xml => @post }
    #end
  end

  def commentsuncheer
    @comment = Comment.find(params[:id])
    @comment.update_attribute(:uncheer,@comment.uncheer.succ )
    redirect_to @comment.post_id
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @post }
    #end
  end
  
end
