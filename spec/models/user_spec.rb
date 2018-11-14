require 'rails_helper'

RSpec.describe User, type: :model do

  let(:new_user) {create(:user)}
  it "user is valid with all require field" do
    expect(new_user).to be_valid
  end

  it "user is invalid without any field" do
    user = User.new
    expect(user).to_not be_valid
  end

  it "user is invalid without name" do
    user = User.new(email: "vijay@mail.com", password_digest:"1")
    expect(user).to_not be_valid
  end

  it "user is invalid without email" do
    user = User.new(name: "Vijay", password_digest:"1")
    expect(user).to_not be_valid
  end

  it "user is invalid without password" do
    user = User.new(name: nil, email: "vijay@mail.com")
    expect(user).to_not be_valid
  end
end
