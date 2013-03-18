class Job < ActiveRecord::Base
  attr_accessible :company_name, :contact_email, :description, :filled?, :title, :website
end
