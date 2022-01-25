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
          player_id:,
          source_id: SOURCE_ID,
          odnoklassniki_id:,
          title:,
          artists:
        }
      end

      def track_extra_data
        {
          albums:,
          image: image_data,
          duration:,
          duration_seconds:,
          audio: audio_data
        }.compact
      end

      def albums_list
        response_data['albums']
      end

      def album_data_formatted(album)
        {
          source_id: SOURCE_ID,
          odnoklassniki_id: album['id'],
          title: album['name']
        }
      end

      def image
        response_data['image']
      end

      def audio_data
        {
          present: audio_present?,
          link: audio_link,
          source_id: SOURCE_ID
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
