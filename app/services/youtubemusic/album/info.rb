module YouTubeMusic
  module Album
    class Info < YouTubeMusic::Album::Base
      private

      def album_data
        {
          **self_data,
          **album_base_data,
          release_date:,
          profiles_count:,
          description:
            description_truncated,
          tracks:,
          **with_more_data
        }.compact
      end

      def album_base_data
        {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data
        }
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def track_data_formatted(
        raw_track_data
      )
        YouTubeMusic::Album::Info::Track.call(
          raw_track_data:,
          album_data: album_base_data,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
