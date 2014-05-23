require 'spec_helper'

describe Clip, :type => :model do

  before :each do
    @clip = Clip.new
    @clip.id = 1
    @clip.playlist_id = 2
    @clip.yt_id = "o-5-B11Gc2U"
    @clip.title = "Chillstep - CMYK - Yellow Chillstep Mix - by Ideal ..."
    @clip.description = nil
  end

  #CREATE
  describe "#new" do
    it 'returns a new clip object' do
      expect(@clip).to be_an_instance_of Clip
    end

    it 'returns nil value of description' do
      expect(@clip.description).to eql nil
    end

  end

  #READ
  describe "#playlist_id" do
    it "returns the correct playlist_id" do
      expect(@clip.playlist_id).to eql 2
    end
  end

  describe "#title" do
    it "returns the correct clip title" do
      expect(@clip.title).to eql "Chillstep - CMYK - Yellow Chillstep Mix - by Ideal ..."
    end
  end

  #UPDATE
  describe "#update/:id'" do
    before(:each) do
      @attributes = { :playlist_id => 5, :yt_id => "MyNewName", :description => "My description" }
      @clip.update(@attributes);
      @clip.reload
    end

    it { expect(@clip.playlist_id).to eql @attributes[:playlist_id] }
    it { expect(@clip.yt_id).to eql @attributes[:yt_id] }
    it { expect(@clip.description).to eql @attributes[:description] }
  end

  #DELETE
  describe "#destroy" do
    it 'returns true when clip is destroyed' do
      @clip.destroy
      expect(@clip.destroyed?).to eql true
    end
  end

end
