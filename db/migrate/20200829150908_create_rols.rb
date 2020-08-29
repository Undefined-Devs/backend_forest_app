class CreateRols < ActiveRecord::Migration[6.0]
  def change
    create_table :rols do |t|
      t.string :name

      t.timestamps
    end
  end
end
