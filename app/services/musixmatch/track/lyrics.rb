module MusixMatch
  module Track
    class Lyrics < MusixMatch::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Lyrics.call(
          source_original_link:,
          source_name:,
          source_track_id: nil,
          source_track_slug: musixmatch_slug,
          title:,
          artists:,
          lyrics: lyrics_formatted
        )
      end

      def lyrics_formatted
        lyrics
          .split("\n")
          .product(["\n"])
          .flatten
          .reject(&:empty?)
      end
    end
  end
end
