require 'rails_helper'

describe User do
  describe '#create' do
    it "is invalid if there is no name" do
      user = User.new(name: "", email: "test_user@design.uk", password: "password")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    
    it "is invalid if there is no email address" do
      user = User.new(name: "test_user", email: "", password: "password")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it "is invalid if there is no password" do
      user = User.new(name: "test_user", email: "aa@design.com", password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end