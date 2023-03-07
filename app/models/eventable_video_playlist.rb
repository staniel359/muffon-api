module EventableVideoPlaylist
  extend ActiveSupport::Concern

  include Eventable

  private

  def eventable_data
    { video_playlist:
        video_playlist_data }
  end

  def video_playlist_data
    {
      youtube_id:
        video_playlist.youtube_id,
      title:
        video_playlist.title
    }
  end
end
