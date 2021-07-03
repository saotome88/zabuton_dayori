FactoryBot.define do
  factory :user do
    nickname             { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    # passwordは半角英数字で6文字以上
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
