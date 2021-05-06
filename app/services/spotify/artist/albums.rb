module Spotify
  module Artist
    class Albums < Spotify::Artist::Base
      private

      def results
        response_data['items']
      end

      def link
        "#{base_link}/albums"
      end

      def data
        {
          artist: {
            page: page,
            total_pages: total_pages,
            albums: albums
          }
        }
      end

      def total_items
        response_data['total']
      end

      def albums
        results.map do |a|
          {
            title: a['name'],
            image: a.dig('images', 0, 'url'),
            released: a['release_date'],
            spotify_id: a['id']
          }
        end
      end
    end
  end
end
