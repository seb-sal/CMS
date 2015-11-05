class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_id
      t.timestamp :date_created
      t.string :profile_pic_uri
      t.string :name
      t.string :username
      t.string :password
      t.string :email
      t.string :office_number
      t.string :cellphone_number
      t.string :job_title
      t.string :company_id
      # t.references :company

      t.timestamps null: false
    end

    # create_table :companies do |t|
    #   t.belongs_to :customer, index: true
    #   t.string :company_id
    #   t.timestamp :date_created
    #   t.integer :count
    #   t.string :company_name
    #   t.integer :company_size
    #   t.string :company_type
    #   t.string :telephone
    #   t.string :logo_uri
    #   t.string :fax
    #   t.string :address
    #   t.string :city
    #   t.string :state
    #   t.string :country
    #   t.string :zip_code
    #   t.string :website_uri
    #   t.string :facebook_uri
    #   t.string :email
    #   t.string :linkedin_uri

    #   t.timestamps null: false
    # end
  end
end
