# frozen_string_literal: true

class RemoveSubjectFromMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :subject
  end
end
