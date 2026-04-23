module MusicBrainz
  module Track
    class Albums < MusicBrainz::Track::Base
      include MusicBrainz::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: musicbrainz_id,
          title:,
          artists:,
          albums:
        )
      end

      def albums
        raw_albums_distinct
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
        MusicBrainz::Album::Info.call(
          album_id:,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
