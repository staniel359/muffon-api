module EventableAlbum
  extend ActiveSupport::Concern

  include Eventable

  private

  def eventable_data
    { album: album_data }
  end

  def album_data
    {
      title: album.title,
      artist: {
        name: album.artist.name
      }
    }
  end
end
