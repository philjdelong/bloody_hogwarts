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


      visit "/courses"
    end

    it "i can see all courses and students enrolled" do

      within "#course-#{@witchcraft.id}" do
        expect(page).to have_content(@witchcraft.name)
        expect(page).to have_content("Students enrolled: #{@witchcraft.total_students}")
      end

      within "#course-#{@wizardry.id}" do
        expect(page).to have_content(@wizardry.name)
        expect(page).to have_content("Students enrolled: #{@wizardry.total_students}")
      end

      within "#course-#{@defense.id}" do
        expect(page).to have_content(@defense.name)
        expect(page).to have_content("Students enrolled: #{@defense.total_students}")
      end

      within "#course-#{@potions.id}" do
        expect(page).to have_content(@potions.name)
        expect(page).to have_content("Students enrolled: #{@potions.total_students}")
      end
    end
  end
end
