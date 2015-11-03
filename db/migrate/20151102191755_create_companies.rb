class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_id
      t.timestamp :date_created
      t.integer :count
      t.string :company_name
      t.integer :company_size
      t.string :company_type
      t.string :telephone
      t.string :logo_uri
      t.string :fax
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :website_uri
      t.string :facebook_uri
      t.string :email
      t.string :linkedin_uri

      t.timestamps null: false
    end
  end
end
