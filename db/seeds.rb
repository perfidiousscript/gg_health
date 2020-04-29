Location.delete_all
Practice.delete_all
User.delete_all


user_list = [
  ["Melinda", "Manager", "melinda.manager@fake.com", 2],
  ["Manny", "Manager", "manny.manager@fake.com", 2],
  ["Patricia", "Practitioner", "patricia.pracitioner@fake.com", 1],
  ["Carrie", "Client", "carrie@fake.com", 0]
]

portland = Geocoder.search("Portland, OR")

bounding_box =  portland[0].data["boundingbox"]

services_list = ["massage", "reiki", "float tank", "matrix energetics", "tarot"]

user_list.each do |first_name, last_name, email_address, role|
  User.create(first_name: first_name, last_name: last_name, email_address: email_address, role: role, password: '12345')
end

melinda = User.find_by_first_name("Melinda")
patty = User.find_by_first_name("Patricia")

practice_list = [
  ["Melindas Massages",[{type:"phone", value:"18005322345"}],[0,1]]
]

practice_list.each do |name, contact, staff|
  melinda.practices.create(name: name, contact: contact, staff: staff)
end

melindas_practice = Practice.find_by_name("Melindas Massages")

# id: integer, name: string, address: string, phone_number: string, contact: jsonb, services: jsonb, practice_id: integer, staff: text, latitude: float, longitude: float

location_list = []

address = ''
phone_number = '4755843948'
contact = {"type":"", "value":""}
staff = [0,1]

20.times do |i|
  service = services_list.sample
  service_hash = {primary_service: service, services_list: ["massage", "infrared sauna", "reiki", "matrix energetics"]}
  name = "Melinda's #{service} #{i}"
  lat = rand(bounding_box[0].to_f..bounding_box[1].to_f)
  long = rand(bounding_box[2].to_f..bounding_box[3].to_f)
  location = melinda.practices.first.locations.create(name: name, address: address, phone_number: phone_number, contact: contact, services: service_hash, latitude: lat, longitude: long, staff: staff, calendar: {})
  location_list.push(location)
end
