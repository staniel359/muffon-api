module Genius
  module Album
    class Info < Genius::Album::Base
      private

      def album_data
        album_base_data
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          title: title,
          genius_id: album['id'],
          artist: artist_data
        }
      end

      def artist_data
        {
          name: artist_name,
          genius_id: album.dig('artist', 'id')
        }
      end

      def album_extra_data
        {
          image: image_data(album['cover_art_url']),
          released: released(album),
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
