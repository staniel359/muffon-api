module MusixMatch
  module Track
    class Lyrics < MusixMatch::Track::Info
      private

      def track_data
        {
          **track_base_data,
          lyrics: lyrics_formatted
        }
      end

      def lyrics_formatted
        lyrics.split("\n")
      end
    end
  end
end
