module Odnoklassniki
  module Track
    class Albums < Odnoklassniki::Track::Info
      private

      def track_data
        track_base_data
          .merge(track_albums_data)
      end

      def track_albums_data
        { albums: }
      end

      def albums
        album_ids
          .map do |album_id|
            album_info(
              album_id
            )
          end
          .compact
      end

      def album_ids
        response_data['albums']
          .pluck('id')
      end

      def album_info(album_id)
        Odnoklassniki::Album::Info.call(
          album_id:,
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end
    end
  end
end
