require 'spec_helper'

describe Playlist, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"


  before :each do
    @playlist = Playlist.new
    @playlist.id = 1
    @playlist.user_id = 2
    @playlist.name = "Playlist name"
  end

  describe "#new" do
    it 'returns a new playlist object' do
      @playlist.should be_an_instance_of Playlist
    end
  end

  describe "#playlist" do
    it "returns the correct user" do
      @playlist.user_id.should eql 2
    end
  end

  describe "#id" do
    it "returns the correct id" do
      @playlist.id.should eql 1
    end
  end

end
