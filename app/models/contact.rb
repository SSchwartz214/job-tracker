class Contact < ApplicationRecord
  validates_presence_of :name, :position, :email, :company_id
  belongs_to :company
end
