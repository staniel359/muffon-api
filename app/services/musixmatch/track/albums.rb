module MusixMatch
  module Track
    class Albums < MusixMatch::Track::Info
      private

      def track_data
        track_base_data
          .merge(track_albums_data)
      end

      def track_albums_data
        { albums: }
      end

      def albums
        [album_data].compact
      end

      def album_data
        MusixMatch::Album::Info.call(
          album_id: track['album_id'],
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end
    end
  end
end
