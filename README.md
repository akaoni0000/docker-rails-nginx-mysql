puma.rbに追加の記述

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
