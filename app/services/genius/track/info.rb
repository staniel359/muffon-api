module Genius
  module Track
    class Info < Genius::Track::Base
      private

      def track_data
        track_base_data
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          title: title,
          genius_id: genius_id,
          player_id: player_id,
          artist: artist_formatted,
          artists: artists
        }
      end

      def track_extra_data
        {
          album: album_formatted,
          albums: albums,
          image: image_data,
          release_date: release_date,
          description: description_truncated,
          tags: tags.first(5),
          lyrics: lyrics_truncated
        }
      end

      def albums
        @albums ||= albums_list.map do |a|
          album_data_formatted(a)
        end
      end

      def release_date
        raw_release_date_formatted(track)
      end

      def albums_list
        track['albums']
      end

      def album_data_formatted(album)
        Genius::Track::Info::Album.call(
          album: album
        )
      end

      def lyrics_truncated
        lyrics.truncate(250)
      end
    end
  end
end
