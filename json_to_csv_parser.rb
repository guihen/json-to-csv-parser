require 'json'

file = File.open('api-response-1.json')
json = JSON.parse(file.read)

csv_header = %(talk data_hora palestrante cargo empresa foto talk_keywords)

talk_event = json["results"][0]["hits"].first
talk = talk_event["title"]
data_hora = talk_event["starts_at"]
participants = talk_event["timeslot_participations"]
palestrante = participants.first["name"]
cargo = participants.first["job_title"]
empresa = participants.first["company_name"]
foto = participants.first["avatar_urls"]["thumb"]
