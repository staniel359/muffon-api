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
          [artist_data]
      end

      def artist_data
        {
          'name' => track['ensemble'],
          'id' => track['masterArtistId']
        }
      end

      def odnoklassniki_id
        track['idForDownload'] ||
          track['id']
      end

      def image_data
        image_data_formatted(
          image, 'track'
        )
      end

      def duration_seconds
        track['duration']
      end

      def audio_data
        {
          present: audio_present?,
          track_id: odnoklassniki_id,
          source_id: source_id
        }
      end

      def audio_present?
        !!track['isDownloadAllowed']
      end
    end
  end
end
