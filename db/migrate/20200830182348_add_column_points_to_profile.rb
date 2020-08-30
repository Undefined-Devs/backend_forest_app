class AddColumnPointsToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :points, :integer, default: 0
  end
end
