module SoundCloud
  module Track
    class Description < SoundCloud::Track::Info
      private

      def track_data
        { description: }
      end
    end
  end
end
