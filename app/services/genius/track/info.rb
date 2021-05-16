module Genius
  module Track
    class Info < Genius::Track::Base
      private

      def track_data
        track_primary_data.merge(track_extra_data)
      end

      def track_primary_data
        {
          title: title,
          genius_id: track['id'],
          artist: artist_data
        }
      end

      def artist_data
        {
          name: artist_name,
          genius_id: track.dig('primary_artist', 'id')
        }
      end

      def track_extra_data
        {
          albums: albums,
          released: released(track),
          description: description_truncated,
          tags: tags.first(5),
          lyrics: lyrics.truncate_words(50)
        }
      end

      def albums
        albums_list.map { |a| album_data(a) }
      end

      def albums_list
        track['albums']
      end

      def album_data(album)
        {
          title: album['name'],
          genius_id: album['id'],
          image: image_data(album['cover_art_url']),
          released: released(album)
        }
      end
    end
  end
end
