class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :username
      t.string :name
      t.string :company_url
      t.string :email
      t.string :access_token

      t.timestamps null: false
    end
  end
end
