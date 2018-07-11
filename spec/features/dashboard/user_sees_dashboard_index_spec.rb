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
  it "sees the top three companies ranked by average level of interest along with their respective average level of interest" do
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

    visit dashboard_index_path

    expect(page).to have_content(company1.name)
    expect(page).to have_content(company2.name)
    expect(page).to have_content(company3.name)
    expect(page).to have_content(expected1)
    expect(page).to have_content(expected2)
    expect(page).to have_content(expected3)
  end
end
