require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    describe 'is invalid without a title and title must be unique' do
      it { should validate_presence_of(:title) }
    end
    describe 'and title must be unique' do
      xit { should validate_uniqueness_of(:title) }
    end
  end
end
