module Bandcamp
  module Track
    class Albums < Bandcamp::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: bandcamp_id,
          source_track_artist_id: artist_bandcamp_id,
          source_model: bandcamp_model,
          title:,
          artists:,
          albums: [album_data].compact
        )
      end

      def album_data
        return if album_bandcamp_id.blank?

        Bandcamp::Album::Info.call(
          artist_id: artist_bandcamp_id,
          album_id: album_bandcamp_id,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
