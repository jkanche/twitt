class AdduncheerTocomments < ActiveRecord::Migration
  def self.up
    add_column :comments, :uncheer, :integer, :default =>0
  end

  def self.down
    remove_column :comment, :uncheer
  end
end
