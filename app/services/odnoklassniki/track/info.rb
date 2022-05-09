module Odnoklassniki
  module Track
    class Info < Odnoklassniki::Track::Base
      private

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
      end

      def track_base_data
        {
          source_id:,
          player_id:,
          odnoklassniki_id:,
          title:,
          artist: artist_names_data,
          artists:
        }
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

      def album_data
        {
          source_id:,
          odnoklassniki_id: album['id'],
          title: album['name']
        }
      end

      def album
        response_data.dig(
          'albums', 0
        )
      end

      def image
        response_data['image']
      end

      def audio_data
        {
          source_id:,
          present: audio_present?,
          link: audio_link
        }
      end

      def audio_link
        Odnoklassniki::Utils::Audio::Link.call(
          link: response_data['play']
        )
      end
    end
  end
end
