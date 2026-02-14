module LibraryAlbumDecorator
  extend ActiveSupport::Concern

  class_methods do
    def associated
      includes(
        :album,
        [{ library_artist: :artist }],
        image_association
      )
    end
  end

  private

  def playlist_ids
    profile
      .playlist_tracks
      .where(
        album_id:
      )
      .pluck(
        :playlist_id
      )
      .uniq
  end
end
