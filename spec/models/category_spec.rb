require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is invalid without a title' do
      category = Category.new()

      expect(category).to be_invalid 
    end
  end
end
