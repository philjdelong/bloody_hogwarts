require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit the students show page", type: :feature do
    before :each do
      @students = Student.all

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

    visit "/students"
    end

    it "i can see all students average age" do
      expect(page).to have_content(@students.average_age)
    end
  end
end


  # ```
  # User Story 4 of 4
  #
  # As a visitor,
  # When I visit '/students'
  # I see the average age of all students.
  #
  # (e.g. "Average Age: 14.5")
  # ```
