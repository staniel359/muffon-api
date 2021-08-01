module Odnoklassniki
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['name']
      end

      def odnoklassniki_id
        track['idForDownload'] || track['id']
      end

      def image_data
        image_data_formatted(image, 'track')
      end

      def duration
        duration_formatted(
          track['duration']
        )
      end

      def audio_data
        {
          present: audio_present?,
          track_id: odnoklassniki_id,
          source_id: self.class::SOURCE_ID
        }
      end

      def audio_present?
        !!track['isDownloadAllowed']
      end
    end
  end
end
