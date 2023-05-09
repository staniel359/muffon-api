module Genius
  module Track
    class Albums < Genius::Track::Info
      private

      def track_data
        track_base_data
          .merge(track_albums_data)
      end

      def track_albums_data
        { albums: }
      end

      def albums
        album_ids.map do |id|
          album_info(id)
        end.compact
      end

      def album_ids
        track['albums'].pluck('id')
      end

      def album_info(album_id)
        Genius::Album::Info.call(
          album_id:,
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end
    end
  end
end
