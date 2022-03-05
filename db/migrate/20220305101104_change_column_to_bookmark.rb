class ChangeColumnToBookmark < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookmarks, :list_id
    add_reference :bookmarks, :user, index: true
  end
end
