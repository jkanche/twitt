class UsersController < ApplicationController
  
   
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
   # @user = User.find(params[:id])
   if session[:user_id]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
    else
      redirect_to( :action => 'login')
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    
    if session[:user_id]!= nil and  User.find_by_name(User.find(session[:user_id]).name).privilege == 1
      @user.update_attribute(:privilege, 1)
    end


    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    
    @posts=Post.find_all_by_name(@user.name)
    @posts.each do |post|
      post.destroy
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def logout
    if session[:user_id]
     session[:user_id] = nil
     reset_session
     flash.now[:notice] = "Logged out"
     redirect_to(:action => 'login' ) 
   else
     redirect_to(:action => 'login' ) 
   end
  end
  
  def login
    if request.post? 
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => "show")
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
    
  end
  
  
 # def priv
    #if !session[:user_id]
    #  redirect_to(:controller => 'users', :action => "login")
  #else
 #  respond_to do |format|
 #     format.html { redirect_to(priv_url) }
  #    format.xml  { head :ok }
  #  end
    #end
  #end

end