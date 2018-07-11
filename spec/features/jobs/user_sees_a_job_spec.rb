require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Baz")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    comment_1 = job.comments.create(author_name: "Lebron James", body: "I don't need a job")
    comment_2 = job.comments.create(author_name: "Darth Vader", body: "Still hiring?")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content(comment_1.author_name)
    expect(page).to have_content(comment_1.body)
    expect(page).to have_content(comment_2.author_name)
    expect(page).to have_content(comment_2.body)

  end
end
  describe "they fill in a comment form" do
    it "displays the comment on the job show" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "Baz")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

      visit company_job_path(company, job)

      fill_in "comment[author_name]", with: "Me"
      fill_in "comment[body]", with: "Sweet job"
      click_on "Submit"
      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("Me")
      expect(page).to have_content("Sweet job")
      expect(page).to have_content("Comments (1)")
    end
  end
