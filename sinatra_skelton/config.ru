# vim:fileencoding=utf-8

$LOAD_PATH.unshift(File.expand_path("#{File.dirname(__FILE__)}/lib/"))
require 'webpage'

run Sinatra::Application

