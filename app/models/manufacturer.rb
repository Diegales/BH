class Manufacturer < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_presence_of :company_name
  attr_accessible :company_name, :city, :telephone, :mail, :address
  def name
      "#{company_name}"
  end
end
