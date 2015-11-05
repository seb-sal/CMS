class Contact < ActiveRecord::Base

  belongs_to :company

  # validates :company_id, presence: true

  def self.search(query)
      where(
      "name LIKE ? OR email LIKE ? OR office_number LIKE ? OR cellphone_number LIKE ?",
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
    )
  end
end

