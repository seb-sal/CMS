class CompanyContact < ActiveRecord::Base
  # attr_accessible :company_contact_id,
  #                 :date_created,
  #                 :profile_pic_uri,
  #                 :name,
  #                 :email,
  #                 :office_number,
  #                 :cellphone_number,
  #                 :company_id

  belongs_to :company

  # validates :company_id, presence: true

    def self.search(query)
      where("name like?", "%#{query}%") &&
      where("email like?", "%#{query}%") &&
      where("office_number like?", "%#{query}%")
      where("cellphone_number like?", "%#{query}%")

  end

end

