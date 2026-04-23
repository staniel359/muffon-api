module LastFM
  module Track
    class Links < LastFM::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: nil
        )
      end
    end
  end
end
