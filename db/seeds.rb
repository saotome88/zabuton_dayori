# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者用アカウント
User.create!(nickname:  "管理者:早乙女",
  email: ENV["ADMIN_EMAIL"],
  password:  ENV["ADMIN_PASSWORD"],
  password_confirmation: ENV["ADMIN_PASSWORD"],
  admin: true)

# テスト用ユーザーアカウント
User.create!(nickname:  "テスト太郎",
  email: "test@test.com",
  password:  "test123",
  password_confirmation: "test123",
  admin: false)