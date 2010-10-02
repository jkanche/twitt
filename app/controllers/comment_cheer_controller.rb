class CommentCheerController < ApplicationController
  def cheer
    @cheers = CommentCheer.find_by_comment_id_and_user_id(params[:id],session[:user_id])
    @comment = Comment.find(params[:id])
    
    if @comment.user_id == session[:user_id]
      respond_to do |format|
         format.html { redirect_to(:back, :notice => "You can't cheer your own comment!!") }
      end
      return
    end
    
    if @cheers and @cheers.user_id == session[:user_id] and @cheers.cheer == 1
      respond_to do |format|
         format.html { redirect_to(:back, :notice => "You already cheered this comment!!") }
      end
      return
    end
    
    if @cheers and @cheers.user_id == session[:user_id] and @cheers.cheer == 0
     respond_to do |format|
         format.html { redirect_to(:back, :notice => "You already uncheered this comment!!") }
      end
      return
    end
    
    
    @cheers = @comment.comment_cheers.create!
    @cheers.update_attribute(:user_id,User.find_by_id(session[:user_id]).id )   
    @cheers.update_attribute(:cheer,@cheers.cheer.succ )
    @comment.update_attribute(:cheer,@comment.cheer.succ)
    respond_to do |format|
         format.html { redirect_to(:back, :notice => "Cheered it!!") }
    end
   
  end

  def uncheer
 @uncheers = CommentCheer.find_by_comment_id_and_user_id(params[:id],session[:user_id])
    @comment = Comment.find(params[:id])
    
    if @comment.user_id == session[:user_id]
      respond_to do |format|
         format.html { redirect_to(:back, :notice => "You can't uncheer your own comment!!") }
      end
      return
    end
    
    if @uncheers and @uncheers.user_id == session[:user_id] and @uncheers.uncheer == 1
      respond_to do |format|
         format.html { redirect_to(:back, :notice => "You already uncheered this comment!!") }
      end
      return
    end
    
    if @uncheers and @uncheers.user_id == session[:user_id] and @uncheers.uncheer == 0
     respond_to do |format|
         format.html { redirect_to(:back, :notice => "You already cheered this comment!!") }
      end
      return
    end
    
    
    @uncheers = @comment.comment_cheers.create!
    @uncheers.update_attribute(:user_id,User.find_by_id(session[:user_id]).id )   
    @uncheers.update_attribute(:uncheer,@uncheers.uncheer.succ )
    @comment.update_attribute(:uncheer,@comment.uncheer.succ)
     respond_to do |format|
           format.html { redirect_to(:back, :notice => "Uncheered it!!") }
      end
  end


end
