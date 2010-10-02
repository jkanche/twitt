require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests
  
  
  test "should not save post without title or content" do
    post = Post.new
    assert !post.valid?
    assert post.errors.invalid?(:title)
    assert post.errors.invalid?(:content)
  end
  
end