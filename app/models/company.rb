class Company < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
    Company.create! row.to_hash
    end
end


  has_many :company_contacts, dependent: :destroy


    # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("company_name like?", "%#{query}%")
    where("company_type like?", "%#{query}%")
    where("city like?", "%#{query}%") &&
    where("country like?", "%#{query}%")
    where("telephone like?", "%#{query}%")

  end
end
