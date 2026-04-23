module YouTubeMusic
  module Track
    class Albums < YouTubeMusic::Track::Base
      include YouTubeMusic::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: youtube_id,
          title:,
          artists:,
          albums:
        )
      end

      def albums
        [album_data]
      end

      def album_data
        YouTubeMusic::Album::Info.call(
          album_id: album_youtube_id,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
