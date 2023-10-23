require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a password field' do
    expect(User.new).to respond_to(:password)
  end

  it 'has a fullname field' do
    expect(User.new).to respond_to(:fullname)
  end


  it 'is valid if password is set and password_confirmation is nil' do
     user = User.new
     user.password = 'foo'
     expect(user.valid?).to be(false)
  end

  it "is invalid if password and password_confirmation are both non-nil and don't match" do
    user = User.new
    user.password = 'foo'
    user.password_confirmation = 'fo0'
    expect(user.valid?).to be(false)
  end

  describe 'authenticate' do
    it 'returns the user if credentials match' do
      user = User.new
      user.password = 'foo'
      expect(user.authenticate('foo')).to eq(user)
    end

    it "returns false if credentials don't match" do
      user = User.new
      user.password = 'foo'
      expect(user.authenticate('fo0')).to be(false)
    end
  end
end