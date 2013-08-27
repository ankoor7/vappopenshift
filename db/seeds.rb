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

addresses = ["15-17 New Street Square, Fetter Ln, London EC4A 3AP", "Broadgate Tower, 20 Primrose Street, London EC2A 2EW","3-7 Stamford St, London SE1 9NY", "29-31 Wellington St, Covent Garden, London WC2E 7DB", "79a Tottenham Court Rd, London W1T 4TD", "6 Dorset Square, London NW1 6QA", "Queen Marys Gardens, London", "115 New Cavendish St, London W1W 6UW", "Paramount House, 162-170 Wardour St, London W1F 8ZX", "2 Hogarth Rd, London, Earls Court, London, Greater London SW5 0PT"]

group = nil
event = nil
user = nil
group_index = 1
volunteer_index = 1
# Setup a single charity
  # charity = Charity.new(email: "test_charity_emailgmail.com", description: "A new charity on the system. Helping the world, one kid at a time.", location: "9 Back Hill, London, N1", name: "The Charity", website: "test_charity.com", phone: "07903555555")
  # charity.save

# Make test Groups and events by nested loops
# Loop through groups
["Foodcycle", "Oxfam", "Unicef", "HackneyPirates", "StreetDoctors", "Chayn", "Student Funder", "MakeSense"].each do |n|
    group = Group.new(email: "test_charity_email_#{n}@gmail.com", description: "A new charity on the system. Helping the world, one kid at a time.", location: addresses[group_index], name: "#{n}", website: "#{n}.com", phone: "0790355555#{n}")
    group.save
    group_index += 1
    (rand(1..3)).times do |volunteer_num|
      user = User.new(email: "test_leader_#{volunteer_index}@#{group.name}.com", firstname: firstnames.sample, lastname: lastnames.sample, phone: "0790355555#{volunteer_num}", password: "password", password_confirmation: "password", t_and_c: true)
      user.save

      group.leaders << user
      group.save
      volunteer_index += 1
    end

    # Loop through events
    (rand(4..6)).times do |event_num|

      event = Event.new(date: (DateTime.now + rand(15)), description: "A test event by #{group.name}", location: addresses.sample, latitude: "", longitude: "", name: "Event #{event_num} at #{group.name}", number_volunteers: rand(9..16))
      event.group = group
      event.save

      # Add volunteers to events

      (rand(5..9)).times do |volunteer_num|
        user = User.new(email: "test_user_#{volunteer_index}@#{group.name}.com", firstname: firstnames.sample, lastname: lastnames.sample, phone: "0790355555#{volunteer_num}", password: "password", password_confirmation: "password", t_and_c: true)
        user.save

        event.volunteers << user
        event.save
        volunteer_index += 1
      end
      group.volunteers << user
    end
  group.save

end

# Make volunteers








