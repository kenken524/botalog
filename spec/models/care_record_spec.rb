require 'rails_helper'

RSpec.describe CareRecord, type: :model do
  before do
    @carerecord = FactoryBot.build(:care_record)
  end

  describe '育成記録' do
    context '育成記録できるとき' do
      it 'description、care_date,imageが存在すれば登録できる' do
        expect(@carerecord).to be_valid
      end
    end
    context '育成記録できないとき' do
      it 'descriptionが空では登録できない' do
        @carerecord.description = ''
        @carerecord.valid?
        expect(@carerecord.errors.full_messages).to include("説明 が未入力です")
      end
      it 'descriptionが501文字以上では登録できない' do
        @carerecord.description = Faker::Lorem.characters(number: 501 )
        @carerecord.valid?
        expect(@carerecord.errors.full_messages).to include("説明 は500文字以内です。")
      end
      it 'care_dateが空では登録できない' do
        @carerecord.care_date = ''
        @carerecord.valid?
        expect(@carerecord.errors.full_messages).to include("記録日 が未入力です")
      end
      it '画像が未選択だと登録できない' do
        @carerecord.image = nil
        @carerecord.valid?
        expect(@carerecord.errors.full_messages).to include("画像 が未入力です")
      end
    end
  end
end
