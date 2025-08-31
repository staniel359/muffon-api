module Odnoklassniki
  module Track
    class Info < Odnoklassniki::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id: player_source_id,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          audio: audio_base_data
        }.compact
      end

      def album_data
        return if album.blank?

        {
          source: album_source_data,
          title: album['name']
        }
      end

      def album
        response_data.dig(
          'albums',
          0
        )
      end

      def album_source_data
        {
          name: source_name,
          id: album['id']
        }
      end

      def image
        response_data['image']
      end

      def audio_link
        Odnoklassniki::Utils::Audio::Link.call(
          link: raw_audio_link
        )
      end

      def raw_audio_link
        response_data['play']
      end
    end
  end
end
