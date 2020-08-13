# frozen_string_literal: true

class AddIndexToArticleIdOnArticles < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :articles, :article_id, algorithm: :concurrently
  end
end
