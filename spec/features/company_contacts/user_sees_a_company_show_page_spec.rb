require 'rails_helper'

describe "user visits company show" do
  context "sees a form to enter a company contact" do
    it "fills out a form and creates a contact" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "Baz")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      contact_name = "RuPaul"
      contact_position = "Queen"
      email = "Rue@company.com"

      visit company_path(company)

      fill_in :contact_name,	with: contact_name
      fill_in :contact_position,	with: contact_position
      fill_in :contact_email,	with: email
      click_on "Create Contact"

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content(contact_name)
      expect(page).to have_content(contact_position)
      expect(page).to have_content(email)
    end
  end
end


=begin
 When the user visits the page for a specific Company, in addition to information about the company there is a form that allows them to enter a Contact for that Company (e.g. “Penelope Santorini”, “Hiring Manager”, “penelope@wooo.com”).
 Each Contact has a full name, position, email, and company (which relates to the company you’ve already created). It should be possible for a Company to have more than one Contact, but a Contact only works at one Company.
 When the user submits a new contact, they are redirected back to the page for that specific company and the contact appears on the page.
=end