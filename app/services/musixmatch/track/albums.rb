module MusixMatch
  module Track
    class Albums < MusixMatch::Track::Info
      private

      def track_data
        {
          **track_base_data,
          albums:
        }
      end

      def albums
        [album_data].compact
      end

      def album_data
        MusixMatch::Album::Info.call(
          album_slug: musixmatch_album_slug,
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end
    end
  end
end
