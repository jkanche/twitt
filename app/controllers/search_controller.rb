class SearchController < ApplicationController
  skip_before_filter
  
  def index_post
    
  end

  def index_user
    
  end

  def live_search_post
     
   if params[:query].empty?
     @user_post
     render(:layout => false)
     return
    end
   
    
    @user_post = Post.find(:all,:conditions => ["content LIKE ? OR title LIKE ? OR name LIKE ?", 
                              "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%"])
    # @user_post = Post.find_by_sql["select * from posts where content = ?",@searchphrase]
    @number_match = @user_post.length
    render(:layout => false)
    
  end

  def live_search_user
    if params[:query].empty? 
     @users
     render(:layout => false)
     return
   end
   
   @users = User.find(:all,:conditions => ["name LIKE ?", "%#{params[:query]}%"])
    @users_match = @users.length
    render(:layout => false)
 end
 
 end
