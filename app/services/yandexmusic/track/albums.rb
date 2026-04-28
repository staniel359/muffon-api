module YandexMusic
  module Track
    class Albums < YandexMusic::Track::Base
      include YandexMusic::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: yandexmusic_id,
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
        album_id
      )
        YandexMusic::Album::Info.call(
          album_id:,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
