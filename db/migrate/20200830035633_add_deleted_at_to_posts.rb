class AddDeletedAtToPosts < ActiveRecord::Migration[6.0]
  def change

    add_column :rols, :deleted_at, :datetime
    add_index :rols, :deleted_at

    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :challenges, :deleted_at, :datetime
    add_index :challenges, :deleted_at

    add_column :post_challenges, :deleted_at, :datetime
    add_index :post_challenges, :deleted_at

    add_column :profiles, :deleted_at, :datetime
    add_index :profiles, :deleted_at

    add_column :posts, :deleted_at, :datetime
    add_index :posts, :deleted_at

    add_column :tokens, :deleted_at, :datetime
    add_index :tokens, :deleted_at

    add_column :active_storage_blobs, :deleted_at, :datetime
    add_index :active_storage_blobs, :deleted_at

    add_column :active_storage_attachments, :deleted_at, :datetime
    add_index :active_storage_attachments, :deleted_at

  end
end
