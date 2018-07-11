require 'rails_helper'

describe "user visits dashboard" do
  it "sees jobs by level of interest" do
    company = Company.create(name: "hahaha")
    category = Category.create(title: "the best")
    Job.create!(title: "foo", description: "bar", level_of_interest: 50, city: "NY", company_id: company.id, category_id: category.id)
    Job.create!(title: "baz", description: "bar", level_of_interest: 70, city: "LA", company_id: company.id, category_id: category.id)

    visit dashboard_index_path

    expect(page).to have_content("Level of Interest: 70 (1)")
    expect(page).to have_content("Level of Interest: 50 (1)")
  end
end
