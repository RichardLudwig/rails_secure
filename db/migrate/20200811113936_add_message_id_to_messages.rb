# frozen_string_literal: true

class AddMessageIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :message_id, :integer
  end
end
