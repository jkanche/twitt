require 'test_helper'

class AuthenticationTest < ActionController::IntegrationTest
  fixtures :all

  test "logging in with valid username and password" do
    
    visit login_users_path
    #fill_in "name", :with => "jayaram"
    user = User.new(:name => "username", :password => "password", :password_confirmation=>"password")
    fill_in "name", :with => "abcde"
    fill_in "password", :with => "abcde"
    click_button "LOGIN"
    
    
  end
  
  
     
end
