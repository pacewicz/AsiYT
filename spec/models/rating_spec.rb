require 'spec_helper'

describe Rating, :type => :model do

  before :each do
    @rating = Rating.new
    @rating.id = 1
    @rating.user_id = 2
    @rating.clip_id = 5
    @rating.value = 2
  end

  #CREATE
  describe "#new" do
    it 'returns a new rating object' do
      expect(@rating).to be_an_instance_of Rating
    end
  end

  #READ
  describe "#id" do
    it "returns the correct rating id" do
      expect(@rating.id).to eql 1
    end
  end

  describe "#user_id" do
    it "returns the correct rating user_id" do
      expect(@rating.user_id).to eql 2
    end
  end

  describe "#clip_id" do
    it "returns the correct rating clip_id" do
      expect(@rating.clip_id).to eql 5
    end
  end

  describe "#value" do
    it "returns the correct rating value" do
      expect(@rating.value).to eql 2
    end
  end

  #UPDATE
  describe "#update/:id'" do
    before(:each) do
      @attributes = { :user_id => 55, :clip_id => 315, :value => 3 }
      @rating.update(@attributes)
      @rating.reload
    end

    it { expect(@rating.user_id).to eql @attributes[:user_id] }
    it { expect(@rating.clip_id).to eql @attributes[:clip_id] }
    it { expect(@rating.value).to eql @attributes[:value] }
  end

  #DELETE
  describe "#destroy" do
    it 'returns true when rating is destroyed' do
      @rating.destroy
      expect(@rating.destroyed?).to eql true
    end
  end

end
