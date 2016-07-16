class AddTagsToCode < ActiveRecord::Migration
  def change
    add_column :codes, :tags, :string
  end
end
