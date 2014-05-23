require 'spec_helper'

describe Playlist, :type => :model do

  before :each do
    @playlist = Playlist.new
    @playlist.id = 1
    @playlist.user_id = 2
    @playlist.name = "Playlist name"
  end

  #CREATE
  describe "#new" do
    it 'returns a new playlist object' do
      expect(@playlist).to be_an_instance_of Playlist
    end
  end

  #READ
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

  #UPDATE
  describe "#update/:id'" do
    before(:each) do
      @attributes = { :user_id => 5, :name => "MyNewName" }
      @playlist.update(@attributes);
      @playlist.reload
    end

    it { expect(@playlist.name).to eql @attributes[:name] }
    it { expect(@playlist.user_id).to eql @attributes[:user_id] }
  end

  #DELETE
  describe "#destroy" do
    it 'returns true when playlist is destroyed' do
      @playlist.destroy
      expect(@playlist.destroyed?).to eql true
    end
  end
end
