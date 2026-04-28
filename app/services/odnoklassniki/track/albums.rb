module Odnoklassniki
  module Track
    class Albums < Odnoklassniki::Track::Base
      include Odnoklassniki::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: odnoklassniki_id,
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

      def raw_albums
        response_data['albums']
      end

      def album_info(
        album_id
      )
        Odnoklassniki::Album::Info.call(
          album_id:,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
