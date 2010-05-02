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
  # 各ページ用の Sinatra ページを集める
  Dir["#{File.dirname(__FILE__)}/controller/**/*.rb"].each {|controller| load controller }

  require 'ruby-debug'
end

# デフォルトの動作
configure :production do
  # 各ページ用の Sinatra ページを集める
  Dir["#{File.dirname(__FILE__)}/controller/**/*.rb"].each {|controller| load controller }

  not_found do
    "Not found"
  end
  
  error do
    "Server Error"
  end
end

# 初期設定
before do
end


# hoge/ のような '/' 終わりを '/' 無しへリダイレクト 
# ただし、 http://example.com の場合は末尾 '/' が付く
get %r{^(.+)/$} do |c|
  redirect c, 303
end

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


