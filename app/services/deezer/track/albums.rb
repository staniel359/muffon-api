module Deezer
  module Track
    class Albums < Deezer::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: deezer_id,
          title:,
          artists:,
          albums:
        )
      end

      def albums
        albums_ids.map do |album_id|
          album_info(album_id)
        end.compact
      end

      def albums_ids
        [
          album_deezer_id,
          fallback_album_deezer_id
        ].compact
      end

      def fallback_album_deezer_id
        raw_track_data.dig(
          'FALLBACK',
          'ALB_ID'
        )
      end

      def album_info(
        album_id
      )
        Deezer::Album::Info.call(
          album_id:,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
