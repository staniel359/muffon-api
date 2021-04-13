module Odnoklassniki
  module Search
    class Albums < Odnoklassniki::Search::Base
      private

      def collection_name
        'albums'
      end

      def collection_list_item(album)
        {
          title: album['name'],
          artist: artist_data(album),
          image: image_data(album, 'album'),
          released: released(album),
          odnoklassniki_id: album['id']
        }
      end
    end
  end
end
