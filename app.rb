require_relative './lib/analytics.rb'
require 'pp'
puts "Reporte de Parque Oasis Bot"

parque_oasis = Analytics.new('smartbots.json')


def created_at(timestamp)
  timestamp.to_i - 10800000)/86400000)+25569
end


def data_extraction(root_object)
  header = "id;userName;origin;msg_count;created_at;userPhone;userEmail;lastMessage;sender" + "\n"
  File.open('results.csv','a'){|file| file.write(header)}
  root_object.chats.each do |chat|
    str = "#{chat[0]};"
    str += "#{chat[1]['userName']};#{chat[1]['origin']};#{chat[1]['messages'].count};#{created_at(chat[1]['createdAt'])};"
    str += "#{chat[1]['userPhone']};"
    str += "#{chat[1]['userEmail']};"
    str += "#{chat[1]['messages'].values.last['message']['speech']};"
    str += "#{chat[1]['messages'].values.last['sender']};"
    str += "\n"
     File.open('results.csv','a'){|file| file.write(str)}
  end
end

def test_data_extraction(root_object)
    root_object.chats.each do |chat|
      puts chat[1]['messages'].values.last['message']
  end
end

data_extraction(parque_oasis)
#test_data_extraction(parque_oasis)
