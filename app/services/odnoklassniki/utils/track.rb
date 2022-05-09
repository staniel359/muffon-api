module Odnoklassniki
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['name']
      end

      def artists_list
        track['allArtists'].presence ||
          [artist]
      end

      def artist
        {
          'id' => track['masterArtistId'],
          'name' => track['ensemble']
        }
      end

      def odnoklassniki_id
        track['idForDownload'] ||
          track['id']
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def duration_seconds
        track['duration']
      end

      def audio_data
        {
          source_id:,
          present: audio_present?,
          track_id: odnoklassniki_id
        }
      end

      def audio_present?
        !!track['isDownloadAllowed']
      end
    end
  end
end
