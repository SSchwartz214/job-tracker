require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, category_id, and company" do
        company = Company.new(name: "Turing")
        category = Category.create(title: "Web Dev")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end

  describe "relationships" do
    it {should have_many(:comments)}
  end

  describe "class methods" do
    it ".level_of_interest" do
      company = Company.create(name: "hahaha")
      category = Category.create(title: "the best")
      Job.create!(title: "foo", description: "bar", level_of_interest: 50, city: "NY", company_id: company.id, category_id: category.id)
      Job.create!(title: "baz", description: "bar", level_of_interest: 70, city: "LA", company_id: company.id, category_id: category.id)

      expected = {70 => 1, 50 => 1}

      expect(Job.level_of_interest).to eq(expected)
    end
    
    it '.top_three' do
    company1 = Company.create(name: "hahaha")
    company2 = Company.create(name: "company2")
    company3 = Company.create(name: "company3")
    category = Category.create(title: "the best")
    Job.create!(title: "foo1", description: "bar", level_of_interest: 30, city: "NY", company_id: company1.id, category_id: category.id)
    Job.create!(title: "baz1", description: "bar", level_of_interest: 40, city: "LA", company_id: company1.id, category_id: category.id)
    Job.create!(title: "foo2", description: "bar", level_of_interest: 50, city: "NY", company_id: company2.id, category_id: category.id)
    Job.create!(title: "baz2", description: "bar", level_of_interest: 60, city: "LA", company_id: company2.id, category_id: category.id)
    Job.create!(title: "foo3", description: "bar", level_of_interest: 70, city: "NY", company_id: company3.id, category_id: category.id)
    Job.create!(title: "baz3", description: "bar", level_of_interest: 80, city: "LA", company_id: company3.id, category_id: category.id)

    expected1 = "35"
    expected2 = "55"
    expected3 = "75"
    ordered_method_output = [["company3", 0.75e2], ["company2", 0.55e2], ["hahaha", 0.35e2]]

    expect(Job.top_three).to eq(ordered_method_output)
    end
  end
end
