class Category < ApplicationRecord
  validates_presence_of :title, on: :create, message: "can't be blank"
end
