require 'json'
require 'csv'

file = File.open('api-response-2.json')
json = JSON.parse(file.read)


csv_file = File.open('websummit.csv', 'w')
csv_file.write CSV.generate_line(%w(talk data_hora palestrante cargo empresa foto talk_keywords))

talk_event = json["results"][0]["hits"].first
talk = talk_event["title"]
data_hora = talk_event["starts_at"]
participants = talk_event["timeslot_participations"]

participants.each do |participant|
  palestrante = participant["name"]
  cargo = participant["job_title"]
  empresa = participant["company_name"]
  foto = participant["avatar_urls"]["thumb"]

  csv_file.write CSV.generate_line([talk, data_hora, palestrante, cargo, empresa, foto, nil])
end
