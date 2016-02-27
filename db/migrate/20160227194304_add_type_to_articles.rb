class AddTypeToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :type, index: true, foreign_key: true
  end
end
