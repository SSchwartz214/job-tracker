require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "blah")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end
end
