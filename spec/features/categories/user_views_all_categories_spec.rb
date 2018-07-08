require 'rails_helper'

describe "user visits categories index" do
  it "sees all categories" do
    category_1 = Category.create(title: "Foo")
    category_2 = Category.create(title: "Bar")
    category_3 = Category.create(title: "Baz")
    category_4 = Category.create(title: "Qux")

    visit categories_path

    expect(page).to have_link(category_1.title)
    expect(page).to have_link(category_2.title)
    expect(page).to have_link(category_3.title)
    expect(page).to have_link(category_4.title)
  end
end

#  The user can view a list of all Categories on a single page, and each Category can be deleted from that page. There is also a link to “Edit” each Category, which takes the user to a form where they can update the Category.
