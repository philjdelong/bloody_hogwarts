require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    it ".average_age" do
      students = Student.all

      h_potter = Student.create(
          name: "Harry Potter",
          age: 12,
          house: "Gryffindor")

      c_black = Student.create(
          name: "Casseopia Black",
          age: 14,
          house: "Syltherin")

      n_longbottom = Student.create(
          name: "Nevil Longbottom",
          age: 13,
          house: "Gryffindor")

      expect(students.average_age).to eq(13)
    end
  end
end
