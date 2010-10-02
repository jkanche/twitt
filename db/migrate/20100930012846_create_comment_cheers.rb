class CreateCommentCheers < ActiveRecord::Migration
  def self.up
    create_table :comment_cheers do |t|
      t.references :comment
      t.references :user
      t.integer :cheer ,:default => 0
      t.integer :uncheer, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :comment_cheers
  end
end
