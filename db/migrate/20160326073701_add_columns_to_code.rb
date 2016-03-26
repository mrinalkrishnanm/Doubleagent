class AddColumnsToCode < ActiveRecord::Migration
  def change
    add_column :codes, :name, :string
    add_column :codes, :difficulty, :string
    add_column :codes, :language, :string
    add_column :codes, :link, :string
    add_column :codes, :github_link, :string
  end
end
