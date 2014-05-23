require 'spec_helper'

describe PlaylistContributor, :type => :model do
  before :each do
    @pl_contr = PlaylistContributor.new
    @pl_contr.id = 1
    @pl_contr.user_id = 43
    @pl_contr.playlist_id = 25
  end

  #CREATE
  describe "#new" do
    it "returns a new playlist contributor object" do
      expect(@pl_contr).to be_an_instance_of PlaylistContributor
    end
  end

  #READ
  describe "#id" do
    it "returns the correct playlist contributor id" do
      expect(@pl_contr.id).to eql 1
    end
  end

  describe "#user_id" do
    it "returns the correct playlist contributor user_id" do
      expect(@pl_contr.user_id).to eql 43
    end
  end

  describe "#playlist_id" do
    it "returns the correct playlist contributor playlist_id" do
      expect(@pl_contr.playlist_id).to eql 25
    end
  end

  #UPDATE
  describe "#update/:id'" do
    before(:each) do
      @attributes = { :user_id => 5, :playlist_id => 4}
      @pl_contr.update(@attributes);
      @pl_contr.reload
    end

    it { expect(@pl_contr.user_id).to eql @attributes[:user_id] }
    it { expect(@pl_contr.playlist_id).to eql @attributes[:playlist_id] }
  end


  #DELETE
  describe "#destroy" do
    it 'returns true when playlist contributor is destroyed' do
      @pl_contr.destroy
      expect(@pl_contr.destroyed?).to eql true
    end
  end


end
