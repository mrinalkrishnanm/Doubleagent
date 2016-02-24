class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :access_token, :string
  end
end
