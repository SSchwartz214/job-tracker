require 'spec_helper'

describe 'user visits a category show page' do
  it "sees all jobs associated with a category" do
    company = Company.create(name: 'Best Place Ever')
    category = Category.create(title: "BAZ")
    job1 = company.jobs.create(title: 'Foo', level_of_interest: '5', city: 'New Jack City', category_id: category.id)
    job2 = company.jobs.create(title: 'Baz', level_of_interest: '4', city: 'New Jack City', category_id: category.id)

    visit category_path(category.id)
save_and_open_page
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job1.level_of_interest)
    expect(page).to have_content(job1.city)
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job2.level_of_interest)
    expect(page).to have_content(job2.title)
  end
end