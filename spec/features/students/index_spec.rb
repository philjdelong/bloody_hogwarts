require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit the students index", type: :feature do
    before :each do
      @h_potter = Student.create(
        name: "Harry Potter",
        age: 12,
        house: "Gryffindor"
        )

      @c_black = Student.create(
        name: "Casseopia Black",
        age: 14,
        house: "Syltherin"
        )

      visit "/students"
    end

    it "i see a list of students with name age house" do
      expect(page).to have_content(@c_black.name)
      expect(page).to have_content(@c_black.age)
      expect(page).to have_content(@c_black.house)
      
      expect(page).to have_content(@h_potter.name)
      expect(page).to have_content(@h_potter.age)
      expect(page).to have_content(@h_potter.house)
    end
  end
end


# ```
# User Story 1 of 4
#
# As a visitor,
# When I visit '/students',
# I see a list of students with the following information:
# -Name
# -Age
# -House
# (e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")
# ```
