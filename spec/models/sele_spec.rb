require 'rails_helper'

describe Sele do
  describe 'sele#create' do
    describe 'presence: true 'do

      it "is valid with a revenue profit name category item_id order_id" do
        sele = build(:sele)
        expect(sele).to be_valid
      end

      it "is invalid without a revenue" do
        sele = build(:sele, revenue: nil)
        sele.valid?
        expect(sele.errors[:revenue]).to include("を入力してください。")
      end

      it "is invalid without a profit" do
        sele = build(:sele, profit: nil)
        sele.valid?
        expect(sele.errors[:profit]).to include("を入力してください。")
      end

      it "is invalid without a name" do
        sele = build(:sele, name: nil)
        sele.valid?
        expect(sele.errors[:name]).to include("を入力してください。")
      end

      it "is invalid without a category" do
        sele = build(:sele, category: nil)
        sele.valid?
        expect(sele.errors[:category]).to include("を入力してください。")
      end

      it "is invalid without a item_id" do
        sele = build(:sele, item: nil)
        sele.valid?
        expect(sele.errors[:item]).to include("を入力してください。")
      end

      it "is invalid without a order_id" do
        sele = build(:sele, order: nil)
        sele.valid?
        expect(sele.errors[:order]).to include("を入力してください。")
      end
      
    end

    describe "numericality" do
      it "is invalid with a revenue less than 299 " do
        sele = build(:sele, revenue: "299")
        sele.valid?
        expect(sele.errors[:revenue]).to include("は300より大きい値にしてください。")
      end

      it "is invalid with a revenue more than 10000000 " do
        sele = build(:sele, revenue: "10000000")
        sele.valid?
        expect(sele.errors[:revenue]).to include("は9999999より小さい値にしてください")
      end
    end
  end
end