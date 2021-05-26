module LastFM
  module Track
    class Description < LastFM::Track::Base
      private

      def track_data
        { description: description }
      end
    end
  end
end
