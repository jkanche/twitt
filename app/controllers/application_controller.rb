# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :authorize, :except => [:login,:logout,:new,:create,:show]
  helper :all # include all helpers, all the time
  protect_from_forgery #:only => '8fc080370e56e929a2d5afca5540a0f7'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected
    def authorize
      return if self.controller_name == 'search'
      unless User.find_by_id(session[:user_id])
        #session[:original_uri] = request.request_uri
        flash[:notice] = "Please log in"
        redirect_to :controller => 'users' , :action => 'login'
      end
  end
  
   def set_user
      @user = User.find(session[:id]) if @user.nil? && session[:id]
    end

    def login_required
      return true if @user
      access_denied
      return false
    end

    def access_denied
      session[:return_to] = request.request_uri
      flash[:error] = 'Oops. You need to login before you can view that page.' 
      redirect_to :controller => 'users', :action => 'login'
    end
  
 
end
