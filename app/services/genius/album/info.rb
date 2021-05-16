module Genius
  module Album
    class Info < Genius::Album::Base
      private

      def album_data
        album_primary_data.merge(album_extra_data)
      end

      def album_primary_data
        {
          title: album['name'],
          genius_id: album['id'],
          artist: artist_data
        }
      end

      def album_extra_data
        {
          image: image_data(album['cover_art_url']),
          released: album_released(album),
          description: description_truncated,
          tracks: tracks_data
        }
      end

      def tracks_data
        Genius::Album::Info::Tracks.call(
          album_id: @args.album_id
        )[:tracks].to_a
      end
    end
  end
end
