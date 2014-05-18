module ClipsHelper
  public
  def params_from_url_and_desc(h)
    vi = VideoInfo.new(h[:url])
    {yt_id: vi.video_id, title: vi.title, thumbnail: vi.thumbnail_medium, description: h[:description], playlist_id: h[:playlist_id], user_id: current_user.id }
  end
end
