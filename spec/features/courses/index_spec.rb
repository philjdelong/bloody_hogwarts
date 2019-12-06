require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit the courses index page", type: :feature do
    before :each do
      @h_potter = Student.create(
          name: "Harry Potter",
          age: 12,
          house: "Gryffindor")

      @c_black = Student.create(
          name: "Casseopia Black",
          age: 14,
          house: "Syltherin")

      @n_longbottom = Student.create(
          name: "Nevil Longbottom",
          age: 13,
          house: "Gryffindor")

      @witchcraft = Course.create(name: "Witchcraft")
      @wizardry = Course.create(name: "Wizardry")
      @defense = Course.create(name: "Defense Against the Dark Arts")
      @potions = Course.create(name: "Potions")

      @c_black.courses << @defense
      @h_potter.courses << @defense
      @n_longbottom.courses << @defense

      @h_potter.courses << @wizardry
      @n_longbottom.courses << @wizardry

      @c_black.courses << @witchcraft

      @h_potter.courses << @potions

      visit "/courses"
    end

    it "i can see all courses" do
      expect(page).to have_content("Witchcraft")
      expect(page).to have_content("Wizardry")
      expect(page).to have_content("Defense Against the Dark Arts")
      expect(page).to have_content("Potions")
    end

    xit "i can see how many students are enrolled in each course" do
      expect(page).to have_content("Witchcraft: 1")
      expect(page).to have_content("Wizardry: 2")
      expect(page).to have_content("Defense Against the Dark Arts: 3")
      expect(page).to have_content("Potions: 1")
    end
  end
end

# ```
# User Story 3 of 4
# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of students enrolled in each course.
#
# (e.g. "Defense Against the Dark Arts: 5"
#       "Herbology: 10")
# ```
