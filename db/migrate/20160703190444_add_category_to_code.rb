class AddCategoryToCode < ActiveRecord::Migration
  def change
  	add_column :codes, :category, :string
  end
end
