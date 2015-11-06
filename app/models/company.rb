class Company < ActiveRecord::Base
  has_many :contacts, dependent: :destroy

  require 'csv'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Company.create! row.to_hash
    end
  end

  # def self.to_csv(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << column_names
  #     all.each do |company|
  #       csv << company.attributes.values_at(*column_name)
  #     end
  #   end
  # end


  def self.search(query)
    where(
      "company_name LIKE ? OR company_type LIKE ? OR city LIKE ? OR country LIKE ? OR telephone LIKE ?",
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
    )
  end
end
