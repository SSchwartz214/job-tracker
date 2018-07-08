require 'rails_helper'

describe "user visits /categories/new" do
  context "fills out a form" do
    it "creates a new category" do
      visit(new_category_path)

      fill_in "category[title]",	with: "Web Development"
      click_on "Create Category"

      expect(current_path).to eq("/categories/#{Category.all.first.id}")
      expect(page).to have_content("Web Development")
    end
    it "redirects to the new page if they try to create a duplicate category" do
      category = Category.create(title:"Web Development")

      visit(new_category_path)

      fill_in "category[title]",	with: "Web Development"
      click_on "Create Category"

      expect(current_path).to eq(new_category_path)
    end
  end
end



=begin
 When the user creates a new Job, they are required to select its Category from a drop down menu of existing categories. They also see a link to create a new Category.
=end