module LastFM
  module Track
    class Description < LastFM::Track::Info
      private

      def track_data
        { description: }
      end
    end
  end
end
