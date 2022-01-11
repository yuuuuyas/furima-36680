FactoryBot.define do
  factory :order_address do
    post_code           {'123-4567'}
    area_id             {2}
    city                {'横浜市'}
    house_number        {'青山1-1-1'}
    building_name       {'柳ビル103'}
    phone_number        {'09012345678'}
    user_id             {1}
    item_id             {2}
    token               {11111111111111111111}
  end 
end