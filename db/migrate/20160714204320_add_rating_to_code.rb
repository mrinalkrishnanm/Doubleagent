class AddRatingToCode < ActiveRecord::Migration
  def change
    add_column :codes, :rating, :integer
  end
end
