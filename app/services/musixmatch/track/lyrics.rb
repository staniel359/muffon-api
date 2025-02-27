module MusixMatch
  module Track
    class Lyrics < MusixMatch::Track::Info
      private

      def headers
        { 'User-Agent' => USER_AGENT }
      end

      def track_data
        track_base_data
          .merge(lyrics_data)
      end

      def lyrics_data
        { lyrics: }
      end

      def lyrics
        raw_lyrics.map do |l|
          "#{l.text}\n"
        end
      end

      def raw_lyrics
        lyrics_response_data.css(
          '.r-1dxmaum'
        )
      end

      def lyrics_response_data
        Nokogiri::HTML.parse(
          lyrics_response.body
        )
      end

      def lyrics_response
        format_get_request(
          link: original_link
        )
      end
    end
  end
end
