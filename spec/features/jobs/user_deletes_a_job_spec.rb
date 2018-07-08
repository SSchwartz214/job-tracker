require 'rails_helper'

describe "User deletes exisiting job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Web Dev")
    job = company.jobs.create(title: "Dev", description: "fun", level_of_interest: 30, city: "Chicago", category_id: category.id)

    visit company_jobs_path(company)

    click_link "Delete"

    expect(page).to have_content("#{job.title} was successfully deleted!")
  end
end
