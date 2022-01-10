require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do 
    @order_address = FactoryBot.build(:order_address)
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
      it '電話番号が10桁以上11桁以内の半角数値でないと登録できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end  
