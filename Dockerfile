FROM ruby:2.5.1

# リポジトリを更新し依存モジュールをインストールする
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

# ルート直下にwebappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /myapp
WORKDIR /myapp

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /myapp

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
