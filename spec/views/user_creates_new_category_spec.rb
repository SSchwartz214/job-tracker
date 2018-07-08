require 'rails_helper'

describe "user visits /categories/new" do
  context "fills out a form" do
    it "creates a new category" do
      visit new_category_path

      fill_in "category[title]",	with: "Web Development"
      click_on "Create Category"

      expect(current_path).to eq(category_path(:id))
      expect(page).to have_content("Web Development")
    end
  end
end



=begin
The user can create a new Category by filling out a form. Each Category has a title (e.g. “Web Development”, “Education”, “Finance”).
 When the user successfully creates a Category they are shown a page with the Category title.
 When the user tries to create a Category that already exists, they are brought back to the page with the form to create a Category.
 The user can view a list of all Categories on a single page, and each Category can be deleted from that page. There is also a link to “Edit” each Category, which takes the user to a form where they can update the Category.
 When the user creates a new Job, they are required to select its Category from a drop down menu of existing categories. They also see a link to create a new Category.
 When the user visits a page for a specific Category, they see a list of Jobs in that Category.
=end