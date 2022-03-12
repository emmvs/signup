class RemoveColumnFromBookmarks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bookmarks, :list, index: true
  end
end
