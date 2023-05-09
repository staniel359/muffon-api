module SoundCloud
  module Track
    class Albums < SoundCloud::Track::Info
      private

      def track_data
        track_base_data
          .merge(track_albums_data)
      end

      def track_albums_data
        { albums: }
      end

      def albums
        []
      end
    end
  end
end
