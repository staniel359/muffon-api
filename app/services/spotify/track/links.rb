module Spotify
  module Track
    class Links < Spotify::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: spotify_id
        )
      end
    end
  end
end
