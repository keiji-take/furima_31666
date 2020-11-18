require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    context '全条件が満たしたら出品できる' do
      it '出品できる時' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない時' do
      it '画像ファイルがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it '商品名が40文字以上だと出品できない' do
        @item.product = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Product is too long (maximum is 40 characters)")
      end
      it '商品説明がないと出品できない' do
        @item.exception = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Exception can't be blank")
      end
      it '商品説明が1000文字以上だと出品できない' do
        @item.exception = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Exception is too long (maximum is 1000 characters)")
      end
      it 'カテゴリー選択しないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態を選択しないと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '送料を選択しないと出品できない' do
        @item.payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer can't be blank")
      end
      it '発送元を選択しないと出品できない' do
        @item.location_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Location can't be blank")
      end
      it '発送日時を選択しないと出品できない' do
        @item.send_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end
      it '商品価格を記入しないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品価格が¥300以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it '商品価格が¥9999999以上であれば出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it '商品価格が半角数字でなければ出品できない' do
        @item.price = '９８rtu'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end