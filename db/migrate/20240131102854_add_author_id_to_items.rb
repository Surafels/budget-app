class AddAuthorIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :author_id, :integer
  end
end
