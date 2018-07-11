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