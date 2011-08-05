require 'net/http'
require 'yaml' 

config = File.open( 'config.yml' ) { |yf| YAML::load( yf ) }
bot_token = config["bot_token"]

puts "Using bot_token #{bot_token}"

# you find a full list with more data at http://botliga.de/datenquellen
next_matches = [14008, 14009, 14010, 14011, 14012, 14013, 14014, 14015, 14016]

http = Net::HTTP.new('botliga.de',80)

next_matches.each do |match_id|
  # insert smart voodoo calculations here
  result = "2:1"
  
  puts "guessing match ##{match_id} - #{result}"
  
  # post your guess
  response, data = http.post('/api/guess',"match_id=#{match_id}&result=#{result}&token=#{bot_token}")

  # "201 Created" (initial guess) or "200 OK" (guess update)
  puts "#{response.code} #{data}" 
end