module MusixMatch
  module Track
    class Info < MusixMatch::Track::Base
      include MusixMatch::Utils::Track

      private

      def track_data
        {
          **self_data,
          **track_base_data,
          album: album_data,
          image: image_data,
          profiles_count:,
          lyrics: lyrics_truncated,
          **with_more_data
        }
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

      def lyrics_truncated
        text_truncated(
          lyrics,
          size: 'small'
        )
      end

      def lyrics
        response_data.dig(
          'pageProps',
          'data',
          'trackInfo',
          'data',
          'lyrics',
          'body'
        )
      end
    end
  end
end
