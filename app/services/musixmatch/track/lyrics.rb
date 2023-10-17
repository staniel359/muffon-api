module MusixMatch
  module Track
    class Lyrics < MusixMatch::Track::Info
      private

      def headers
        super.merge(
          lyrics_headers
        )
      end

      def lyrics_headers
        { 'User-Agent' => user_agent }
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
          '.mxm-lyrics__content'
        )
      end

      def lyrics_response_data
        Nokogiri::HTML.parse(
          lyrics_response
        )
      end

      def lyrics_response
        RestClient.get(
          original_link
        )
      end
    end
  end
end
