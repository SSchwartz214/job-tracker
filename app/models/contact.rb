class Contact < ApplicationRecord
  belongs_to :company
  validates_presence_of :name, :position, :email, :company_id
end
