module Genius
  module Track
    class Albums < Genius::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: genius_id,
          title:,
          artists:,
          albums:
        )
      end

      def albums
        raw_albums
          .map do |raw_album_data|
            album_info(
              raw_album_data['id']
            )
          end
          .compact
      end

      def album_info(
        raw_album_id
      )
        Genius::Album::Info.call(
          album_id: raw_album_id,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
