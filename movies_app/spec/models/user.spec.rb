require 'rails_helper'

describe User do
  let(:user) {User.new}

  describe "validates presence of attributes" do
    it "requires a username" do
      user.username = ""
      expect(user.valid?).to be false

      # user = User.create(username: "", email: "joel@gmail.com", password: "password")
      # expect(user.username).should_not be_valid
    end

    it "requires a email" do
      user.email = ""
      expect(user.valid?).to be false

      # user = User.create(username: "joel", email: "", password: "password")
      # expect(user.email).should_not be_valid
    end

    it "requires a password" do
      user.password = ""
      expect(user.valid?).to be false

      # user = User.create(username: "joel", email: "joel@gmail.com", password: "")
      # expect(user.password).should_not be_valid
    end
  end

  describes "key" do
    it "has a readable key" do
      user.key = "monkey"
      expect(user.key).to eq "monkey"
    end
  end
end
