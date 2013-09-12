require 'spec_helper'

describe Event do
  before :each do
        @user1 = User.new(email: "test@gmail.com", firstname: "Arthur", lastname: "McLovin", phone: "07903555555", password: "password", password_confirmation: "password", t_and_c: true)
        @user1.save
        @user2 = User.new(email: "test2@gmail.com", firstname: "Arthur2", lastname: "McLovin", phone: "07903555555", password: "password", password_confirmation: "password", t_and_c: true)
        @user2.save
        @event = Event.new(date: (DateTime.now + rand(15)), description: "A test event ", location: "9 Back Hill, London, N1", name: "Event", number_volunteers: 9)
        @event.stub(:geocode).and_return([1,1])
        @event.save
        @group = Group.new(email: "test@gmail.com", description: "A new charity on the system. Helping the world, one kid at a time.", location: "9 Back Hill, London, N1", name: "Test", website: "test.com", phone: "07903555555")
        @group.stub(:geocode).and_return([1,1])
        @group.save
  end

  describe "#initialize" do
    it "should create an Event object" do
      expect(@event).to be_an_instance_of Event
    end

    it "should hold the passed variables defining the event" do
      answer = 'A test event ', '9 Back Hill, London, N1', 'Event', 9
      expect([@event.description, @event.location, @event.name, @event.number_volunteers]).to eql answer
    end
  end

  describe "adding an event to a group" do
    it " should add the event to the group" do
      @group.events << @event
      expect(@group.events.first).to eql @event
    end
  end

  describe "register a user for an event" do
    it " should add the user to the event" do
      @event.register(@user1)
      expect(@event.volunteers.first).to eql @user1
    end
    it " should not be allowed if already registered for the event" do
      @event.register(@user1)
      expect(@event.volunteers.count).to eql 1
    end
    it " should not be allowed if event is fully booked" do
      @event.register(@user2)
      expect(@event.volunteers.count).to eql 1
    end
  end


end
