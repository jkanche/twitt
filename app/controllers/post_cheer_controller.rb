class PostCheerController < ApplicationController
  
  def cheer
    @cheers = PostCheer.find_by_post_id_and_user_id(params[:id],session[:user_id])
    @post = Post.find(params[:id])
    
    if @post.user_id == session[:user_id]
      respond_to do |format|
         format.html { redirect_to(:back, :notice => "You can't cheer your own post!!") }
      end
      return
    end
    
    if @cheers and @cheers.user_id == session[:user_id] and @cheers.cheer == 1
      respond_to do |format|
         format.html { redirect_to(:back, :notice => "You already cheered this post!!") }
      end
      return
    end
    
    if @cheers and @cheers.user_id == session[:user_id] and @cheers.cheer == 0
     respond_to do |format|
         format.html { redirect_to(:back, :notice => "You already uncheered this post!!") }
      end
      return
    end
    
    
    @cheers = @post.post_cheers.create!
    @cheers.update_attribute(:user_id,User.find_by_id(session[:user_id]).id )   
    @cheers.update_attribute(:cheer,@cheers.cheer.succ )
    @post.update_attribute(:cheer,@post.cheer.succ)
    respond_to do |format|
         format.html { redirect_to(:back, :notice => "Cheered it!!") }
    end
    
   
  end

  def uncheer
    @uncheers = PostCheer.find_by_post_id_and_user_id(params[:id],session[:user_id])
    @post = Post.find(params[:id])
    
    if @post.user_id == session[:user_id]
      respond_to do |format|
         format.html { redirect_to(:back, :notice => "You can't uncheer your own post!!") }
      end
      return
    end
    
    if @uncheers and @uncheers.user_id == session[:user_id] and @uncheers.uncheer == 1
      respond_to do |format|
         format.html { redirect_to(:back, :notice => "You already uncheered this post!!") }
      end
      return
    end
    
    if @uncheers and @uncheers.user_id == session[:user_id] and @uncheers.uncheer == 0
     respond_to do |format|
         format.html { redirect_to(:back, :notice => "You already cheered this post!!") }
      end
      return
    end
    
    
    @uncheers = @post.post_cheers.create!
    @uncheers.update_attribute(:user_id,User.find_by_id(session[:user_id]).id )   
    @uncheers.update_attribute(:uncheer,@uncheers.uncheer.succ )
    @post.update_attribute(:uncheer,@post.uncheer.succ)
     respond_to do |format|
           format.html { redirect_to(:back, :notice => "Uncheered it!!") }
      end
  end

end
