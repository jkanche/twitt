class Post < ActiveRecord::Base
  
  attr_accessor :name
  #validates_presence_of :name
  validates_presence_of :title ,:length => { :minimum => 5 }
  validates_presence_of :content
  
    
  has_many :comments
  has_many :post_cheers
  
  belongs_to :user, :foreign_key => "user_id"
end
