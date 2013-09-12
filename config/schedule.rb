every 1.day, :at => '4:30 am' do
  rake "email:send_event_approaching_emails"
end
