require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context 'ユーザー登録ができる時' do
      it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayがあれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = 'yamada1225'
        @user.password_confirmation = 'yamada1225'
        expect(@user).to be_valid
      end
      it "first_nameが全角文字であれば登録できる" do
        @user.first_name = '陸太郎'
        expect(@user).to be_valid
      end
      it "last_nameが全角文字であれば登録できる" do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end  
    end
    context 'ユーザーが登録できる時' do
      it "nicknameが空だと登録できない" do 
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end
      it "emailが重複してはいけない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに＠が含まれている" do
        @user.email = 'yamada.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以上でないと登録できない" do
        @user.password = 'ya12'
        @user.password_confirmation = 'ya12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが半角英数字の混合でないと登録できない" do
        @user.password = 'yamada'
        @user.password_confirmation = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it "passwordとpassword(確認)が不一致では登録" do
        @user.password = 'yama12'
        @user.password_confirmation = 'yama13'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameは全角文字でないと登録できない" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end
      it "last_nameは全角文字でないと登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが全角文字でないと登録できない" do
        @user.first_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana には全角カタカナを使用してください")
      end
      it "last_name_kanaが全角文字でないと登録できない" do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カタカナを使用してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

