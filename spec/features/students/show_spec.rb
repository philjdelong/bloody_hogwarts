require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit a students show page", type: :feature do
    before :each do
      @h_potter = Student.create(
          name: "Harry Potter",
          age: 12,
          house: "Gryffindor")

      @c_black = Student.create(
          name: "Casseopia Black",
          age: 14,
          house: "Syltherin")

      @witchcraft = @c_black.courses.create(name: "Witchcraft")
      @wizardry = @h_potter.courses.create(name: "Wizardry")
      @defense = @c_black.courses.create(name: "Defense Against the Dark Arts")
      @potions = @h_potter.courses.create(name: "Potions")

        visit "students/#{@h_potter.id}"
    end

    it "i see a list of that students courses" do
      expect(page).to have_content("Wizardry")
      expect(page).to have_content("Potions")

      expect(page).to_not have_content("Witchcraft")
      expect(page).to_not have_content("Defense Against the Dark Arts")
    end
  end
end

# ```
# User Story 2 of 4
#
# As a visitor,
# When I visit '/students/:id'
# I see a list of the students' courses.
#
# (e.g. "Defense against the Dark Arts"
#       "Herbology"
#       "Potions")
# ```
