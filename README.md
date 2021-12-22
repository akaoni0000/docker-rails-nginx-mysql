## ファイルの準備
ディレクトリを作成 <br>
`git clone git@github.com:akaoni0000/file.git`<br>
移動<br>
`cd file`<br>
railsプロジェクトを作成<br>
`docker-compose run app rails new . --force --database=mysql`<br>
railsファイルを変更する<br>
## puma.rbに追加の記述

#追加
<p>
app_root = File.expand_path("../..", __FILE__)
</p>
<p>
bind "unix://#{app_root}/tmp/sockets/puma.sock"
</p>
<p>
stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true
</p>

## database.ymlの一部を変更
default: &default<br>
  adapter: mysql2<br>
  encoding: utf8mb4<br>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %><br>
  username: root<br>
  password: `password`<br> 
  host: `db`<br>
  passwordとhostのところを変更する dbというのはdocker-compose.ymlに書いてあるサービス名<br>
  
## dockerコマンドを打ち込む
イメージを作成<br>
`docker-compose build`<br>
コンテナを起動<br>
`docker-compose up -d`

  
