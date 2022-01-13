require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do 
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '配送先情報の登録' do
    context '配送先情報が登録できる時' do
      it 'post_code,area_id,city,house_number,phone_numberがあれば登録できる' do
        expect(@order_address).to be_valid
      end
      it '郵便番号が「３桁ハイフン４桁」の半角文字列であれば保存できる' do
        @order_address.post_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it '建物名がなくても登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '配送情報が登録できない時' do
      it '郵便番号がないと登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank") 
      end
      it '郵便番号が「３桁ハイフン４桁」の半角文字列でないと保存できない' do
        @order_address.post_code = '12344567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県の情報がないと登録できない' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村の情報がないと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地の情報がないと登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号がないと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数値でないと登録できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上では登録できない' do
        @order_address.phone_number = 111111111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下では登録できない' do
        @order_address.phone_number = 111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンがないと登録できない'do 
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end  
