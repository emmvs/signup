class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :role, :integer
    add_column :users, :language, :integer
    add_column :users, :target_language, :integer
    add_column :users, :reputation, :integer
  end
end
