class CompanyContact < ActiveRecord::Base

  belongs_to :company

  # validates :company_id, presence: true

    def self.search(query)
      where("name like?", "%#{query}%") &&
      where("email like?", "%#{query}%") &&
      where("office_number like?", "%#{query}%")
      where("cellphone_number like?", "%#{query}%")

  end

end

