class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string, limit: 30
    add_column :users, :lastname, :string, limit: 30
  end
end
