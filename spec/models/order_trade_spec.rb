require 'rails_helper'

RSpec.describe OrderTrade, type: :model do
  before do
    @order_trade = FactoryBot.build(:order_trade)
  end
  describe '商品購入の登録情報'do
    context '商品が購入できるとき' do
      it '郵便番号,住所,電話番号,クレジットカード情報が正しく入力されているとき' do
        expect(@order_trade).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it '郵便番号,住所,電話番号,クレジットカード情報が空とき' do
        @order_trade.post_code = ''
        @order_trade.prefecture = ''
        @order_trade.city = ''
        @order_trade.house_num = ''
        @order_trade.tel = ''
        @order_trade.token = ''
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)", "Prefecture can't be blank", "City can't be blank", "House num can't be blank", "Tel can't be blank", "Tel is invalid", "Token can't be blank")
      end
      it '郵便番号が正しく入力されていないとき' do
        @order_trade.post_code = '1234567'
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '電話番号が正しく入力されていないとき' do
        @order_trade.tel = '090-1234-5678'
        @order_trade.valid?
        expect(@order_trade.errors.full_messages).to include("Tel is invalid")
      end
    end
  end
end
