# -*- coding: utf-8 -*-

# root の場合だけ、/になる。それ以外の場合は末尾に/はつかないよ
get '/' do
  haml :index, :locals => {:hoge => 'variables hoge'}
end

