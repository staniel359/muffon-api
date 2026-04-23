module SoundCloud
  module Track
    class Links < SoundCloud::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: soundcloud_id
        )
      end
    end
  end
end
