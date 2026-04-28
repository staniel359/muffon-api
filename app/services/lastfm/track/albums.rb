module LastFM
  module Track
    class Albums < LastFM::Track::Base
      include LastFM::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: nil,
          title:,
          artists:,
          albums: [album_data].compact
        )
      end

      def album_data
        return if raw_album_data.blank?

        LastFM::Album::Info.call(
          artist_name: album_artist_name,
          album_title:,
          is_list: true,
          **self_args
        )[:album]
      end

      def album_artist_name
        raw_album_data['artist']
      end
    end
  end
end
