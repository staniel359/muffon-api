module MusixMatch
  module Track
    class Info < MusixMatch::Track::Base
      include MusixMatch::Utils::Track

      private

      def link
        "#{BASE_LINK}/track.get"
      end

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track
        response_data.dig(
          'message', 'body', 'track'
        )
      end

      def track_base_data
        {
          source: source_data,
          player_id:,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def track_extra_data
        {
          album: album_data,
          profiles_count:,
          tags: tags_truncated,
          lyrics: lyrics_truncated
        }.compact
      end

      def lyrics
        MusixMatch::Track::Info::Lyrics.call(
          track_id: @args[:track_id]
        ).dig(
          :track, :lyrics
        )
      end

      def tags_list
        track.dig(
          'primary_genres',
          'music_genre_list'
        )
      end

      def tag_name_formatted(tag)
        tag.dig(
          'music_genre',
          'music_genre_name'
        )
      end
    end
  end
end
