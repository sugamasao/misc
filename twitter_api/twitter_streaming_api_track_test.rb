#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'rubygems'
require 'json'
require 'pit'
require 'pp'

USERNAME = Pit.get("twitter_user")["username"]
PASSWORD = Pit.get("twitter_user")["password"]

uri = URI.parse('http://stream.twitter.com/1/statuses/filter.json')
Net::HTTP.start(uri.host, uri.port) do |http|
  request = Net::HTTP::Post.new(uri.request_uri)
  request.set_form_data('track' => 'OAuth')

  request.basic_auth(USERNAME, PASSWORD)
  http.request(request) do |response|
    raise 'Response is not chuncked' unless response.chunked?
    response.read_body do |chunk|
      status = JSON.parse(chunk) rescue next
      next unless status['text'] #&& status['text'].include?('http://bit.ly')
      user = status['user']
      puts "#{user['screen_name']}: #{status['text']}"
    end
  end
end

