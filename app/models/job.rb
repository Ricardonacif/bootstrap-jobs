#encoding: UTF-8
class Job < ActiveRecord::Base
  attr_accessible :company_name, :contact_email, :description, :filled, :title, :website
  
  validates_presence_of :company_name, :contact_email, :description, :title, :website
  validates :contact_email, email_format: {:message => 'O formato do e-mail está incorreto.'}
  belongs_to :user

  scope :already_filled, where(filled: false)
  scope :not_filled, where(filled: true)
end
