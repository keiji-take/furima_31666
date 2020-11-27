require 'rails_helper'

RSpec.describe OrderTrade, type: :model do
  before do
    @order_trade = FactoryBot.build(:order_trade)
  end
  describe '商品購入の登録情報' do
    context '商品が購入できるとき' do
      it '郵便番号,住所,電話番号,クレジットカード情報が正しく入力されているとき' do
        expect(@order_trade).to be_valid
      end
      it '建物名がなくても購入できるとき' do
        @order_trade.building_name = ''
        expect(@order_trade).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it '郵便番号がからのとき' do
        @order_trade.post_code = ''
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が空のとき' do
        @order_trade.prefecture = ''
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空のとき' do
        @order_trade.city = ''
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空のとき' do
        @order_trade.house_num = ''
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空のとき' do
        @order_trade.tel = ''
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("Tel can't be blank")
      end
      it 'クレジット情報が空のとき' do
        @order_trade.token = ''
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号にハイフン(-)がないとき' do
        @order_trade.post_code = '1234567'
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号が8桁以上の数字とき' do
        @order_trade.post_code = '11111111'
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '電話番号にハイフン(-)があるとき' do
        @order_trade.tel = '090-1234-5678'
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が12桁以上の数字のとき' do
        @order_trade.tel = '11111111111111111111'
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include()
      end
    end
  end
end
