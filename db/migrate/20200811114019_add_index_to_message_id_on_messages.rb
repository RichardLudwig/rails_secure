class AddIndexToMessageIdOnMessages < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :messages, :message_id, :algorithm => :concurrently
  end
end
