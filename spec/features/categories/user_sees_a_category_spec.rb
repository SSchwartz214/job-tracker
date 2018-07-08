require 'spec_helper'

describe 'user visits a category show page' do
  it "sees all jobs associated with a category" do
    category = Category.create(title: "BAZ")
    job1 = category.jobs.create(title: 'Foo', level_of_interest: '5', city: 'New Jack City')
    job2 = category.jobs.create(title: 'Baz', level_of_interest: '4', city: 'New Jack City')

    visit category_path(category)

    expect(page).to have_content(job1.title)
    expect(page).to have_content(job1.level_of_interest)
    expect(page).to have_content(job1.city)
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job2.level_of_interest)
    expect(page).to have_content(job2.title)
  end
end