require 'rails_helper'

RSpec.describe Instructor, type: :model do
  let(:instructor) { FactoryBot.create(:instructor) }

  it "has a valid factory" do
    expect(instructor).to be_valid
  end

  it "is invalid without a fullname" do
    instructor.fullname = nil
    expect(instructor).to_not be_valid
  end

  it "is invalid without an email" do
    instructor.email = nil
    expect(instructor).to_not be_valid
  end

  it "is invalid without a valid email format" do
    instructor.email = "invalid-email-format"
    expect(instructor).to_not be_valid
  end

  it "can have many feedbacks" do
    feedback1 = FactoryBot.create(:feedback, instructor: instructor)
    feedback2 = FactoryBot.create(:feedback, instructor: instructor)

    expect(instructor.feedbacks.count).to eq(2)
    expect(instructor.feedbacks).to include(feedback1, feedback2)
  end
end

