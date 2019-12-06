require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "methods" do
    before :each do
      @course = Course.create(name: "Course Name")
      @student = Student.create(
        name: "Student",
        age: 15,
        house: "House Name"
      )
      @student.courses << @course
    end

    it "a course can tell me how many students are enrolled" do
      expect(@course.total_students).to eq(1)
    end
  end
end
