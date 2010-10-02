class CreatePostCheer < ActiveRecord::Migration
  def self.up
    create_table :post_cheers do |t|
      t.references :post
      t.references :user
      t.integer :cheer, :default => 0
      t.integer :uncheer, :default => 0

      t.timestamps
  end

  def self.down
    drop_table :post_cheers
  end
  end
end
