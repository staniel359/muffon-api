module Odnoklassniki
  module Search
    class Artists < Odnoklassniki::Search::Base
      private

      def collection_name
        'artists'
      end

      def collection_list
        return super if first_artist.blank?

        super.prepend(first_artist)
      end

      def first_artist
        response_data.dig('bestMatch', 'artist')
      end

      def collection_list_item(artist)
        {
          name: artist['name'],
          image: image_data(artist, 'artist'),
          odnoklassniki_id: artist['id']
        }
      end
    end
  end
end
