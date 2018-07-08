require 'rails_helper'

describe "User edits and existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 80, city: "Denver")

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Host"
    fill_in "job[description]", with: "special"
    fill_in "job[level_of_interest]", with: 90
    fill_in "job[city]", with: "New York"
    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
  end
end
