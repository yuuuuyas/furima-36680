require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できる時' do
      it 'item_name,explanation,category_id,status_id,delivery_charge_id,area_id,delivery_date_id,priceがあれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できない時' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank") 
      end
      it '商品の説明がないと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報がないと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報がないと登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域の情報がないと登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end  
      it '発送までの日数の情報がないと登録できない' do
        @item.delivery_date_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it '価格の情報がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は半角数字でないと登録できない' do
        @item.price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userと紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'カテゴリーに「--」が選択されている場合は出品できない' do
        @item.category_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品の状態に「--」が選択されている場合は出品できない' do
        @item.status_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it '配送料の負担に「--」が選択されている場合は出品できない' do
        @item.delivery_charge_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge is not a number')
      end
      it '発送元の地域に「--」が選択されている場合は出品できない' do
        @item.area_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area is not a number')
      end
      it '発送までの日数に「--」が選択されている場合は出品できない' do
        @item.delivery_date_id = '--'
        @item.valid? 
        expect(@item.errors.full_messages).to include('Delivery date is not a number')
      end
      it '価格が300円未満では出品できない' do
        @item.price = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9999999円を超えると出品できない' do
        @item.price = '100000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
