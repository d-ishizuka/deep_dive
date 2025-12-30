# Gemfileで管理してbundle installしているので不要
# require "bundler/inline"

# gemfile do
#   source "https://rubygems.org"
#   gem "activerecord", "~> 7.1"
#   gem "pg"
# end

require "active_record"
require "logger"

ActiveRecord::Base.logger = Logger.new(STDOUT)

# 接続情報を5433に変更
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  host: "localhost",
  port: 5555, # 普段のと被らないようにしている
  username: "postgres",
  password: "password",
  database: "ar_deep_dive"
)

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :name
    t.jsonb :settings
  end
end

class User < ActiveRecord::Base
end

user = User.create!(name: "Postgres 5433", settings: { thenme: "dark" })
p user