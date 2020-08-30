class CreateChallengesPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges_posts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end

    add_index :challenges_posts, [:post_id, :challenge_id], :unique => true

    add_column :challenges_posts, :deleted_at, :datetime
    add_index :challenges_posts, :deleted_at
    
  end
end
