require 'spec_helper'

describe User, :type => :model do

  before :each do
    @user = User.new
    @user.id = 1
    @user.nick = "Andrzej"
    @user.password = "VeryFinalHaslo"
  end

  #CREATE
  describe "#new" do
    it 'returns a new user object' do
      expect(@user).to be_an_instance_of User
    end
  end

  #READ
  describe "#id" do
    it "returns the correct user id" do
      expect(@user.id).to eql 1
    end
  end

  describe "#nick" do
    it "returns the correct user nick" do
      expect(@user.nick).to eql "Andrzej"
    end
  end

  describe "#password" do
    it "returns the correct user password" do
      expect(@user.password).to eql "VeryFinalHaslo"
    end
  end

  #DELETE
  describe "#destroy" do
    it 'returns true when user is destroyed' do
      @user.destroy
      expect(@user.destroyed?).to eql true
    end
  end

end
