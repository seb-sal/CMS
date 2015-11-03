class CreateCompanyContacts < ActiveRecord::Migration
  def change
    create_table :company_contacts do |t|
      t.string :company_contact_id
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

      t.timestamps null: false
    end
  end
end
