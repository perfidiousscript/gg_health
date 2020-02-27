Location.delete_all
Practice.delete_all
User.delete_all


user_list = [
  ["Melinda", "Manager", "melinda.manager@fake.com", 2],
  ["Patricia", "Practitioner", "patricia.pracitioner@fake.com", 2],
  ["Carrie", "Client", "carrie@fake.com", 0]
]

user_list.each do |first_name, last_name, email_address, role|
  User.create(first_name: first_name, last_name: last_name, email_address: email_address, role: role)
end

melinda = User.find_by_first_name("Melinda")
patty = User.find_by_first_name("Patricia")

practice_list = [
  ["Melindas Massages",{"phone":"18005322345"},[0,1]]
]

practice_list.each do |name, contact, staff|
  melinda.practices.create(name: name, contact: contact, staff: staff)
end

melindas_practice = Practice.find_by_name("Melindas Massages")

location_list = [
  ["Melindas Massages","345 98th St Portland, OR", "18005322345", {}, {"services": "massage"}, [melinda.id,patty.id]]
]

location_list.each do | name, address, phone_number, contact, services, staff|
  byebug
  melinda.practices.first.locations.create(name: name, address: address, phone_number: phone_number, contact: contact, services: services, staff: staff)
end
