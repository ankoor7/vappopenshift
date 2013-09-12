require "cancan/matchers"
require 'spec_helper'

describe Ability do
  before :each do
    # Make instances
    @guest = User.new
    @user1 = User.new(email: "test@gmail.com", firstname: "Arthur", lastname: "McLovin", phone: "07903555555", password: "password", password_confirmation: "password", t_and_c: true, )
    @event1 = Event.new(date: DateTime.now, description: "A test event ", location: "9 Back Hill, London, N1", name: "Event", number_volunteers: 9)
    @group1 = Group.new(email: "test@gmail.com", description: "A new charity on the system. Helping the world, one kid at a time.", location: "9 Back Hill, London, N1", name: "Test", website: "test.com", phone: "07903555555")
    @user2 = User.new(email: "test2@gmail.com", firstname: "Arthur2", lastname: "McLovin", phone: "07903555552", password: "password", password_confirmation: "password", t_and_c: true)
    @event2 = Event.new(date: DateTime.now, description: "A test event ", location: "9 Back Hill, London, N1", name: "Event", number_volunteers: 9)
    @group2 = Group.new(email: "test2@gmail.com", description: "A new charity on the system. Helping the world, one kid at a time.", location: "9 Back Hill, London, N1", name: "Test2", website: "test2.com", phone: "07903555552")
    # Associate all the instances
    @group1.events << @event1
    @event1.volunteers << @user1
    @group1.leaders << @user1

    # Stub geocode
    @event1.stub(:geocode).and_return([1,1])
    @group1.stub(:geocode).and_return([1,1])
    # SAVE them
    @user1.save
    @event1.save
    @group1.save
    @group2.events << @event2
    @event2.volunteers << @user2
    @group2.leaders << @user2
    @user2.save
    @event2.stub(:geocode).and_return([1,1])
    @group2.stub(:geocode).and_return([1,1])
    @event2.save
    @group2.save
  end


  describe "user" do
  let(:ability) { Ability.new(@user1) }
    it "can manage their accounts" do
      ability.should be_able_to(:manage, @user1)
    end

    it "cannot manage other users accounts" do
      ability.should_not be_able_to(:manage, @user2)
    end

    it "can manage their own groups events" do
      ability.should be_able_to(:manage, @event1)
    end

    it "cannot manage other events of groups they do not lead" do
      ability.should_not be_able_to(:manage, @event2)
    end

    it "can manage thier group" do
      ability.should be_able_to(:manage, @group1)
    end

    it "cannot manage others groups" do
      ability.should_not be_able_to(:manage, @group2)
    end
  end

  describe "guest" do
  let(:ability) { Ability.new(@guest) }
    it "can read groups and events" do
      ability.should be_able_to(:show, @group1)
      ability.should be_able_to(:show, @event1)
    end

    it "cannot edit, update destroy create groups" do
      ability.should_not be_able_to(:edit, @group1)
      ability.should_not be_able_to(:update, @group1)
      ability.should_not be_able_to(:create, @group1)
      ability.should_not be_able_to(:destroy, @group1)
    end

    it "cannot edit, update destroy create events" do
      ability.should_not be_able_to(:edit, @event1)
      ability.should_not be_able_to(:update, @event1)
      ability.should_not be_able_to(:create, @event1)
      ability.should_not be_able_to(:destroy, @event1)
    end
    it "cannot manage users" do
      ability.should_not be_able_to(:manage, @user1)
    end
  end

end
