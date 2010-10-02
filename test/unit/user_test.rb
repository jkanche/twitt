require 'test_helper'
class UserTest < ActiveSupport::TestCase
  
  def test_uniqueness
  user = User.new(:name => "abcdefg", :password => "abcde", :password_confirmation=>"abcdfe")
  assert !user.valid?
  assert user.errors.invalid?(:password)
  end
  
end