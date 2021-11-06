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
          id: id,
          player_id: player_id,
          source_id: SOURCE_ID,
          genius_id: genius_id,
          title: title,
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

      def description
        track['description_preview']
      end

      def tags_list
        track['tags']
      end

      def lyrics_truncated
        lyrics.truncate(250)
      end

      def lyrics
        Genius::Track::Info::Lyrics.call(
          track_slug: track['path']
        )[:lyrics]
      end
    end
  end
end
