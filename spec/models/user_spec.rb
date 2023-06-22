require 'rails_helper'

RSpec.describe User, type: :model do
  it "should validate email is present" do
    user = User.create
    expect(user.errors[:email]).to_not be_empty
  end
  it "should validate an encrypted password is present" do
    user = User.create
    expect(user.errors[:encrypted_password]).to_not be_empty
  end
end
