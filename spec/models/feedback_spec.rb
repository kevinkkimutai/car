require 'rails_helper'

RSpec.describe Feedback, type: :model do
  let(:feedback) { FactoryBot.create(:feedback) }

  it "has a valid factory" do
    expect(feedback).to be_valid
  end

  it "is invalid without a content" do
    feedback.content = nil
    expect(feedback).to_not be_valid
  end

  it "is invalid without a pair_id" do
    feedback.pair_id = nil
    expect(feedback).to_not be_valid
  end

  it "is invalid without an instructor_id" do
    feedback.instructor_id = nil
    expect(feedback).to_not be_valid
  end

  it "belongs to a pair" do
    expect(feedback.student).to be_instance_of(Student)
  end

  it "belongs to an instructor" do
    expect(feedback.instructor).to be_instance_of(Instructor)
  end
end
