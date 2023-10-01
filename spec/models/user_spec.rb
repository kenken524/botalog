require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、profile,imageが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス が未入力です")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレス は既に登録されています。")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス は@を含めてください。")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード が未入力です", "パスワード再確認 が一致していません")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'テストテスト'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード再確認 が一致していません", "パスワード は半角英数字のどちらかを含む形式で入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード が短すぎます")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード が長すぎます", "パスワード は半角英数字のどちらかを含む形式で入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード再確認 が一致していません")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネーム が未入力です")
      end
      it 'profileが空では登録できない' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("プロフィール が未入力です")
      end
      it '画像が未選択だと登録できない' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("プロフィール画像 が未入力です")
      end
    end
  end
end