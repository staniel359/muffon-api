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
          extra_title: extra_title,
          player_id: player_id,
          artist: artist_formatted,
          artists: artists
        }.compact
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
        return if album.blank?

        {
          title: album['title'],
          vk_id: album['id'],
          vk_owner_id: album['owner_id'],
          vk_access_key: album['access_key']
        }
      end

      def album
        @album ||= track['album']
      end

      def image_data
        image_data_formatted(
          album_image_data, 'track'
        )
      end

      def album_image_data
        album.try(:[], 'thumb')
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
          link: track['url'],
          track_id: @args.track_id
        )
      end
    end
  end
end
