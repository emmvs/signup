class DeleteStatusInModels < ActiveRecord::Migration[6.1]
  def change
    remove_column :signs, :status, :integer
    remove_column :users, :role, :integer
    remove_column :users, :reputation, :integer
  end
end
