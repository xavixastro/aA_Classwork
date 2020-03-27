# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:session_token)}

  subject(:user){FactoryBot.create(:user)}
  
  describe "ensure there is a session token" do
    it "assigns a session token if none is given" do
      expect(FactoryBot.create(:user).session_token).to_not be_nil
    end
  end

  describe "password encryption" do
    it "does not save password to database" do
      FactoryBot.create(:user, username:"bill_murray")
      user = User.find_by(username: "bill_murray")
      expect(user.password).to_not be("123456")
    end

    it "encrypts password" do
      expect(BCrypt::Password).to receive(:create).with("123456")
      FactoryBot.build(:user)
    end
  end

  describe "find user by credentials" do
    it "finds the user with valid credentials" do
      FactoryBot.create(:user, username:"Mike")
      user = User.find_by_credentials("Mike", "123456")
      expect(user).to_not be_nil
    end

    it "returns nil with invalid credentials" do
      FactoryBot.create(:user, username:"Mike")
      user = User.find_by_credentials("Mike", "12345")
      expect(user).to be_nil
    end
  end
end
