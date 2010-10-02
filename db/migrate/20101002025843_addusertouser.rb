class Addusertouser < ActiveRecord::Migration
  def self.up
  end
 @user = User.create :name => "admin",  :password => "admin",  :password_confirmation => "admin"
 @user.update_attribute(:privilege,1)
  def self.down
  end
end
