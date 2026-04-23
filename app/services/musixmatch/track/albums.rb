module MusixMatch
  module Track
    class Albums < MusixMatch::Track::Base
      include MusixMatch::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: nil,
          source_track_slug: musixmatch_slug,
          title:,
          artists:,
          albums:
        )
      end

      def albums
        [album_data].compact
      end

      def album_data
        MusixMatch::Album::Info.call(
          album_slug: album_musixmatch_slug,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
