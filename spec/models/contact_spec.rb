require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:company_id) }
  end

  describe 'relationships' do
    it { should belong_to(:company) }
  end
end
