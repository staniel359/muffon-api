module YouTubeMusic
  module Track
    class Links < YouTubeMusic::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: youtube_id
        )
      end
    end
  end
end
