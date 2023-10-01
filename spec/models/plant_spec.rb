require 'rails_helper'

RSpec.describe Plant, type: :model do
  before do
    @plant = FactoryBot.build(:plant)
  end

  describe '植物登録' do
    context '登録できるとき' do
      it 'nameとdescription、start_date,imageが存在すれば登録できる' do
        expect(@plant).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @plant.name = ''
        @plant.valid?
        expect(@plant.errors.full_messages).to include("植物名 が未入力です")
      end
      it 'nameが11文字以上では登録できない' do
        @plant.name = Faker::Lorem.characters(number: 11 )
        @plant.valid?
        expect(@plant.errors.full_messages).to include("植物名 は10文字以内です。")
      end
      it 'descriptionが空では登録できない' do
        @plant.description = ''
        @plant.valid?
        expect(@plant.errors.full_messages).to include("説明 が未入力です")
      end
      it 'descriptionが501文字以上では登録できない' do
        @plant.description = Faker::Lorem.characters(number: 501 )
        @plant.valid?
        expect(@plant.errors.full_messages).to include("説明 は500文字以内です。")
      end
      it 'start_dateが空では登録できない' do
        @plant.start_date = ''
        @plant.valid?
        expect(@plant.errors.full_messages).to include("管理開始日 が未入力です")
      end
      it '画像が未選択だと登録できない' do
        @plant.image = nil
        @plant.valid?
        expect(@plant.errors.full_messages).to include("画像 が未入力です")
      end
    end
  end
end
