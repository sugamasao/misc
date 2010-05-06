# -*- coding: utf-8 -*-
# root の場合は呼ばれない。SubURIでアクセスした場合は、'/' へ正規化する
get '' do
  redirect get_prefix + "/", 303
end

# root の場合だけ、/になる。それ以外の場合は末尾に/はつかないよ
get '/' do
  haml :index, :locals => {:hoge => 'variables hoge'}
end

