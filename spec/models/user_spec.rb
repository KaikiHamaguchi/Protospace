require 'rails_helper'
describe User do
  describe '#create' do
    #nameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    # nameが空では登録できないこと
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    # emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    #重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # passwordが空では登録できないこと
    it "is invalid without an password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    #passwordが7文字以下であれば登録できないこと
    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    #passwordが8文字以上であれば登録できること
    it "is invalid with a password that has more than 8 characters " do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
    end
  end

end

