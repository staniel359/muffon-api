module LastFM
  module Track
    class Links < LastFM::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end
