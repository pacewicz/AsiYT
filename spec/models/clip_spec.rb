require 'spec_helper'

describe Clip, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"


  before :each do
    @clip = Clip.new
    @clip.id = 1
    @clip.playlist_id = 2
    @clip.yt_id = "o-5-B11Gc2U"
    @clip.title = "\"Chillstep - CMYK - Yellow Chillstep Mix - by Ideal ...\""
    @clip.description = nil
  end

  describe "#new" do
    it 'returns a new clip object' do
      @clip.should be_an_instance_of Clip
    end

    it 'returns nil value of description' do
      @clip.description.should eql nil
    end

  end

  describe "#playlist_id" do
    it "returns the correct playlist_id" do
      @clip.playlist_id.should eql 2
    end
  end

  describe "#title" do
    it "returns the correct clip title" do
      @clip.title.should eql "\"Chillstep - CMYK - Yellow Chillstep Mix - by Ideal ...\""
    end
  end

end
