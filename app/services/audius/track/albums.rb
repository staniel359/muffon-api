module Audius
  module Track
    class Albums < Audius::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: audius_id,
          title:,
          artists:,
          albums:
        )
      end

      def albums
        [album_data].compact
      end

      def album_data
        return if album_audius_id.blank?

        Audius::Album::Info.call(
          album_id: album_audius_id,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
