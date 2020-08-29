class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :expires_at
      t.string :token
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
