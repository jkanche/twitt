class AddCheerTocomments < ActiveRecord::Migration
  def self.up
    add_column :comments, :cheer, :integer, :default =>0
  end

  def self.down
    remove_column :comments, :cheer
  end
end
