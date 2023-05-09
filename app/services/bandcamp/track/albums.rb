module Bandcamp
  module Track
    class Albums < Bandcamp::Track::Info
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
        return if album_bandcamp_id.blank?

        Bandcamp::Album::Info.call(
          artist_id: artist_bandcamp_id,
          album_id: album_bandcamp_id,
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end
    end
  end
end
