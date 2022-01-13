FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'yamada1225'}
    password_confirmation {password}
    first_name            {'陸太郎'}
    last_name             {'山田'}
    first_name_kana       {'リクタロウ'}
    last_name_kana        {'ヤマダ'}
    birthday              {'1930-12-25'}
  end
end