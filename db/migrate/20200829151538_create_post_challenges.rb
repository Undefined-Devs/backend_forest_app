class CreatePostChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :post_challenges do |t|
      t.references :post, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
