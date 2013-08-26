require 'spec_helper'

describe User do
  before :each do
  @user1 =  User.new(role: "user", firstname: "Arthur", lastname: "McLovin", phone: "05555555555", email: "test@gmail.com", password: "password", password_confirmation: "password", t_and_c: true)
  end

  describe "#initialize" do
    it "should create a User object" do
      expect(@user1).to be_an_instance_of User
    end
    it "should hold the passed variables defining the user" do
      answer = 'user', 'Arthur', 'McLovin', '05555555555', "test@gmail.com"
      expect([@user1.role, @user1.firstname, @user1.lastname, @user1.phone, @user1.email ]).to eql answer
    end
  end
end
