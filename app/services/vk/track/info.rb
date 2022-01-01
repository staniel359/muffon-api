module VK
  module Track
    class Info < VK::Track::Base
      private

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          player_id:,
          source_id: SOURCE_ID,
          vk_id:,
          title:,
          extra_title:,
          artists:
        }.compact
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          duration:,
          duration_seconds:,
          audio: audio_data
        }.compact
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        @audio_link ||=
          VK::Utils::Audio::File.call(
            track_id: vk_track_id,
            link: track['url']
          )
      end
    end
  end
end
