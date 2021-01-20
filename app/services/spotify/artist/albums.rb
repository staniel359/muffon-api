module Spotify
  module Artist
    class Albums < Spotify::Artist::Base
      private

      def results
        response_data['items']
      end

      def link
        "#{artist_base_link}/albums"
      end

      def params
        { offset: offset, limit: limit }
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

      def total_items
        response_data['total']
      end

      def albums_data
        results.map do |a|
          {
            title: a['name'],
            images: images(a, 'album'),
            spotify_id: a['id']
          }
        end
      end
    end
  end
end
