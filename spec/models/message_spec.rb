require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { FactoryBot.create(:message) }

  it "has a valid factory" do
    expect(message).to be_valid
  end

  it "is invalid without a content" do
    message.content = nil
    expect(message).to_not be_valid
  end

  it "is invalid without a sender_user_id" do
    message.sender_user_id = nil
    expect(message).to_not be_valid
  end

  it "is invalid without a recipient_user_id" do
    message.recipient_user_id = nil
    expect(message).to_not be_valid
  end

  it "belongs to a sender" do
    expect(message.sender).to be_instance_of(User)
  end

  it "belongs to a recipient" do
    expect(message.recipient).to be_instance_of(User)
  end
end
