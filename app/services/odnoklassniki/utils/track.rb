module Odnoklassniki
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['name']
      end

      def raw_artists
        track['allArtists'].presence ||
          [artist]
      end

      def artist
        {
          'id' => track['masterArtistId'],
          'name' => track['ensemble']
        }
      end

      def source_data
        {
          name: source_name,
          id: odnoklassniki_id,
          links: source_links_data
        }
      end

      def odnoklassniki_id
        track['id']
      end

      def original_link
        "https://ok.ru/music/track/#{odnoklassniki_id}"
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def duration
        track['duration']
      end

      def audio_present?
        true
      end
    end
  end
end
