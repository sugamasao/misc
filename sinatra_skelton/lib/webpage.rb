# -*- coding: utf-8 -*-

require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

set :haml, {:format => :html5 }
set :sass, {:style => :compact } 
set :root, File.dirname(__FILE__) + "/.."
set :public, File.dirname(__FILE__) + '/../public'

# 環境変数が無ければ再設定
ENV['RACK_ENV'] ||= "production"

# 開発時用
configure :development do 
  puts "develop"
  require 'ruby-debug'
end

# デフォルトの動作
configure :production do
  puts "pro"
  not_found do
    "Not found"
  end
  
  error do
    "Server Error"
  end
end

# 初期設定
before do
  # PATH_INFO を / なしに合わせる
  request.env['PATH_INFO'].gsub!(/\/$/, '')
end

# 各ページ用の Sinatra ページを集める
Dir["#{File.dirname(__FILE__)}/controller/**/*.rb"].each {|controller| load controller }

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end


#####################
# CSS 出力用
#####################
get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end


