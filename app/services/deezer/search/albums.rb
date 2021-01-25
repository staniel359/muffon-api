module Deezer
  module Search
    class Albums < Deezer::Search::Base
      include Deezer::Paginated

      private

      def model_name
        'album'
      end

      def collection_name
        'albums'
      end

      def collection_item_data(album)
        {
          title: album['title'],
          artist: artist_data(album),
          images: images_data(album, 'album'),
          deezer_id: album['id']
        }
      end

      def artist_data(album)
        { name: album.dig('artist', 'name') }
      end
    end
  end
end
