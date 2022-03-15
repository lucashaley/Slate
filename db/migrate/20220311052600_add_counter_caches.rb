class AddCounterCaches < ActiveRecord::Migration[7.0]
  def change
    add_column :ideas, :comments_count, :integer
    add_column :ideas, :bookmarks_count, :integer
  end
end
