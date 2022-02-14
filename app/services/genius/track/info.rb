module Genius
  module Track
    class Info < Genius::Track::Base
      private

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          player_id:,
          source_id: SOURCE_ID,
          genius_id:,
          title:,
          artists:
        }
      end

      def track_extra_data
        {
          album: albums&.first,
          image: image_data,
          release_date:,
          description: description_truncated,
          tags: tags&.first(5),
          lyrics: lyrics_truncated
        }.compact
      end

      def albums_list
        track['albums']
      end

      def album_data_formatted(album)
        Genius::Track::Info::Album.call(
          album:
        )
      end

      def release_date
        raw_release_date_formatted(
          track
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
