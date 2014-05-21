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
      expect(@playlist).to be_an_instance_of Playlist
    end
  end

  describe "#playlist" do
    it "returns the correct user" do
      # @playlist.user_id.expect eql 2
      expect( @playlist.user_id ).to eql 2
    end
  end

  describe "#id" do
    it "returns the correct id" do
      expect(@playlist.id).to eql 1
    end
  end
end
