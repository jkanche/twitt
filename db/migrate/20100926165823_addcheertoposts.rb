class Addcheertoposts < ActiveRecord::Migration
  def self.up
    add_column :posts, :cheer, :integer, :default =>0
  end

  def self.down
    remove_column :posts, :uncheer
  end
end
