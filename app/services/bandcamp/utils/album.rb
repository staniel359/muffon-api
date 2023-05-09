module Bandcamp
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['title']
      end

      def source_data
        {
          name: source_name,
          id: bandcamp_id,
          artist_id:
            artist_bandcamp_id,
          model: bandcamp_model,
          links: source_links
        }
      end

      def bandcamp_id
        album['item_id']
      end

      def bandcamp_model
        album['item_type']
      end

      def original_link
        album['bandcamp_url']
      end

      def streaming_link
        streaming_link_formatted(
          'album',
          bandcamp_id
        )
      end

      def artist_data
        {
          source: artist_source_data,
          name: artist_name
        }
      end

      def artist_source_data
        {
          name: source_name,
          id: artist_bandcamp_id
        }
      end

      def artist_bandcamp_id
        album['band_id']
      end

      def artist_name
        album['band_name']
      end

      def image_data
        image_data_formatted(
          image(
            album
          )
        )
      end

      def release_date
        date_formatted(
          album['release_date']
        )
      end
    end
  end
end
