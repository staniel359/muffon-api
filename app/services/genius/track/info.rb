module Genius
  module Track
    class Info < Genius::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id: player_source_id,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          tags: tags_truncated,
          lyrics: lyrics_truncated
        }.compact
      end

      def release_date
        raw_release_date_formatted(
          track
        )
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def description
        track['description_preview'].presence
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: 'extrasmall'
        )
      end

      def raw_tags
        track['tags']
      end

      def lyrics_truncated
        text_truncated(
          lyrics_string,
          size: 'small'
        )
      end

      def lyrics_string
        return if lyrics.blank?

        lyrics
          .map do |lyric_data|
            lyric_data_formatted(
              lyric_data
            )
          end
          .join
      end

      def lyrics
        @lyrics ||=
          Genius::Track::Info::Lyrics.call(
            track_slug:
          )[:lyrics]
      end

      def track_slug
        track['path']
      end

      def lyric_data_formatted(
        lyric_data
      )
        case lyric_data
        when Hash
          lyric_data[:text]
        when String
          lyric_data
        end
      end
    end
  end
end
