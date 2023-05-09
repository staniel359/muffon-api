module Deezer
  module Track
    class Albums < Deezer::Track::Info
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
        [
          album_id,
          fallback_album_id
        ].compact
      end

      def album_id
        track['ALB_ID']
      end

      def fallback_album_id
        track.dig(
          'FALLBACK', 'ALB_ID'
        )
      end

      def album_info(album_id)
        Deezer::Album::Info.call(
          album_id:,
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end
    end
  end
end
