module VK
  module Track
    class Info < VK::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id:,
          title:,
          extra_title:,
          artist: artist_names_data,
          artists:
        }.compact
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          duration_seconds:,
          audio: audio_data
        }.compact
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link
        }
      end

      def audio_link
        return 'test.mp3' if test?

        @audio_link ||=
          VK::Utils::Audio::File.call(
            track_id: vk_track_id,
            link: track['url']
          )
      end
    end
  end
end
