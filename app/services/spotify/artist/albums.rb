module Spotify
  module Artist
    class Albums < Spotify::Base
      include Spotify::Paginated

      private

      def primary_args
        [@args.artist_id]
      end

      def no_data?
        results.blank?
      end

      def results
        response_data['items']
      end

      def link
        "#{base_link}/artists/#{@args.artist_id}/albums"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          page: page,
          total_pages: total_pages,
          albums: albums_data
        }
      end

      def total_items_count
        response_data['total']
      end

      def albums_data
        results.map { |r| album_data(r) }
      end

      def album_data(album)
        {
          title: album['name'],
          image: image_data(album, 'album'),
          spotify_id: album['id']
        }
      end
    end
  end
end
