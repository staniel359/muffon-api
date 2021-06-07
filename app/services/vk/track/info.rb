module VK
  module Track
    class Info < VK::Track::Base
      private

      def track_data
        track_base_data
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          title: title,
          vk_id: vk_id,
          player_id: player_id,
          artist: artist_formatted,
          artists: artists
        }
      end

      def track_extra_data
        {
          albums: albums,
          image: image_data,
          duration: duration,
          audio: audio_data
        }
      end

      def albums
        [album_data_formatted].compact
      end

      def album_data_formatted
        return if track[19].blank?

        {
          vk_id: track.dig(19, 1),
          owner_id: track.dig(19, 0),
          access_hash: track.dig(19, 2)
        }
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        @audio_link ||= VK::Utils::Audio::File.call(
          link: track[2],
          track_id: @args.track_id
        )
      end
    end
  end
end
