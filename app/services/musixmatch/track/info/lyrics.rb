module MusixMatch
  module Track
    class Info
      class Lyrics < MusixMatch::Track::Info
        private

        def link
          "#{BASE_LINK}/track.lyrics.get"
        end

        def track_data
          { lyrics: }
        end

        def lyrics
          raw_lyrics.split(
            "\n...\n\n*******"
          )[0]
        end

        def raw_lyrics
          response_data.dig(
            'message',
            'body',
            'lyrics',
            'lyrics_body'
          )
        end
      end
    end
  end
end
