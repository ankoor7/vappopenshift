require 'spec_helper'

describe User do
  before :each do
        @user1 = User.new(email: "test@gmail.com", firstname: "Arthur", lastname: "McLovin", phone: "07903555555", password: "password", password_confirmation: "password", t_and_c: true)
        @user1.save
        @event = Event.new(date: (DateTime.now + rand(15)), description: "A test event ", location: "9 Back Hill, London, N1", latitude: "", longitude: "", name: "Event", number_volunteers: 1)
        @event.stub(:geocode).and_return([1,1])
        @event.save
  end

  describe "#initialize" do
    it "should create a User object" do
      expect(@user1).to be_an_instance_of User
    end
    it "should hold the passed variables defining the user" do
      answer = 'user', 'Arthur', 'McLovin', '07903555555', "test@gmail.com"
      expect([@user1.role, @user1.firstname, @user1.lastname, @user1.phone, @user1.email ]).to eql answer
    end
  end


end
