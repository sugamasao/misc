# -*- coding: utf-8 -*-

get '' do
  haml :index, :locals => {:hoge => 'variables hoge'}
end

