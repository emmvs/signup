class AddStatusInModels < ActiveRecord::Migration[6.1]
  def change
    add_column :signs, :status, :integer, default: 0
    add_column :users, :role, :integer, default: 0
    add_column :users, :reputation, :integer, default: 0
  end
end
