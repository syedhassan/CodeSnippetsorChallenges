#!/usr/bin/env ruby

require 'mechanize'

regex = /http:\/\/letsrevolutionizetesting.com\/challenge\?id=\d*/
base_url = "http://letsrevolutionizetesting.com/challenge.json"

agent = Mechanize.new
agent.request_headers = {'Accept' => 'json'}

while true
  response = agent.get base_url
  json = JSON.parse(response.body)
  matches = regex.match json["follow"]
  if matches.nil?
    puts response.body
    break
  else
    base_url = json["follow"].sub("challenge", "challenge.json")
  end
end
