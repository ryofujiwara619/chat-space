require "rails_helper"

describe Message do
  describe "#create" do
    context "it is valid" do
    # メッセージがあれば保存できる
    it "is valid with a body" do
      message = build(:message)
      expect(message).to be_valid
    end

    # bodyがなくてもimageがあれば保存できる
    it "is valid with a image and without a body" do
      message = build(:message, body:"")
      expect(message).to be_valid
    end

    # imageがなくてもbodyがあれば保存できる
    it "is valid with a body and without a image" do
      message = build(:message, image:"")
      expect(message).to be_valid
    end
  end

    context "it is invalid" do

    # メッセージも画像も無いと保存できない
    it "is invalid without neither body nor image" do
        message = build(:message, body:"", image:"")
        message.valid?
        expect(message.errors[:body]).to include("を入力してください")
      end

    # group_idが無いと保存できない
    it "is invalid without a group_id" do
      message = build(:message, group_id:"")
        message.valid?
        expect(message.errors[:group_id]).to include("を入力してください")
    end

    # user_idが無いと保存できない
    it "is invalid without a user_id" do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end
  end

  end
end