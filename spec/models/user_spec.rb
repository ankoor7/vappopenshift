require 'spec_helper'

describe User do
  before :each do
        @user1 = User.new(email: "test@gmail.com", firstname: "Arthur", lastname: "McLovin", phone: "07903555555", password: "password", password_confirmation: "password", t_and_c: true)
        @user1.save
        @event = Event.new(date: (DateTime.now + rand(15)), description: "A test event ", location: "9 Back Hill, London, N1", latitude: "", longitude: "", name: "Event", number_volunteers: rand(9..16))
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

  describe "volunteering for an event" do
    it " should add the user to the event" do
      @event.volunteers << @user1
      expect(@event.volunteers.first).to eql @user1
    end
    it " should not be allowed if already registered for the event" do
      pending "add some examples to (or delete) #{__FILE__}"
    end
  end


end
