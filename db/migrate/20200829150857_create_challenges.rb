class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
