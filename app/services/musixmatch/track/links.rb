module MusixMatch
  module Track
    class Links < MusixMatch::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: nil,
          source_track_slug: musixmatch_slug
        )
      end
    end
  end
end
