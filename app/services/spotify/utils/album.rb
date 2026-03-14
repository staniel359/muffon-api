module Spotify
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        raw_album_data['name']
      end

      def raw_artists
        raw_album_data.dig(
          'artists',
          'items'
        )
      end

      def source_data
        {
          name: source_name,
          id: spotify_id,
          links: source_links_data
        }
      end

      def spotify_id
        raw_album_data['uri'].sub(
          'spotify:album:',
          ''
        )
      end

      def original_link
        "https://open.spotify.com/album/#{spotify_id}"
      end

      def streaming_link
        streaming_link_formatted(
          model: 'album',
          model_id: spotify_id
        )
      end

      def image_data
        image_data_formatted(
          raw_images
        )
      end

      def raw_images
        raw_album_data.dig(
          'coverArt',
          'sources'
        )
      end

      def release_date
        date_formatted(
          raw_release_date.to_s
        )
      end

      def raw_release_date
        raw_album_data.dig(
          'date',
          'year'
        )
      end
    end
  end
end
