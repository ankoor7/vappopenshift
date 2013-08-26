# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Event.destroy_all
Group.destroy_all
Charity.destroy_all

firstnames = ["Adam", "Salman", "James", "Andrea", "Britney", "Luke", "Will", "Charles J", "Stewart", "Julien", "Ankoor", "Emile"]
lastnames = ["Smith", "Westfield", "Hogan", "Skywalker", "Simpson", "Threadneedle", "Rothchild", "Kenobi", "Powers"]


# Setup a single charity
  charity = Charity.new(email: "test_charity_email@gmail.com", description: "A new charity on the system. Helping the world, one kid at a time.", location: "9 Back Hill, London, N1", name: "The Charity", website: "test_charity.com", phone: "07903555555")
  charity.save

# Make test Charities, Groups and events by nested loops
# Loop through charities
["Foodcycle", "Oxfam", "Unicef", "HackneyPirates", "Street Doctors", "Chayn", "Student Funder"].each do |n|
  charity = Charity.new(email: "test_charity_email_#{n}@gmail.com", description: "A new charity on the system. Helping the world, one kid at a time.", location: "9 Back Hill, London, N1", name: "#{n}", website: "#{n}.com", phone: "0790355555#{n}")
  charity.save

# Loop through groups
  (rand(5..9)).times do |group_num|
    group = Group.new(email: "test_group_email_#{group_num}", location: "9 Back Hill, London, N1", name: "Test group #{group_num}", phone: "0790355555#{group_num}", website: "test_group_#{group_num}.com")

    group.charity=charity
    group.save

    # Loop through events
    (rand(5..9)).times do |event_num|

      event = Event.new(date: "", description: "A test event at #{group.name} at #{charity.name}", location: "9 Back Hill, London, N1", latitude: "", longitude: "", name: "Test event at #{charity.name}", number_volunteers: rand(9..16))
      event.group = group
      event.save

      (rand(5..9)).times do |volunteer_num|
        user = User.new(email: "test_user_email_#{volunteer_num}", firstname: firstnames.sample, lastname: lastnames.sample, phone: "0790355555#{volunteer_num}", password: "password", password_confirmation: "password", t_and_c: true)
        # user.event = event
        user.save
      end
    end
  end
end

# Make volunteers








