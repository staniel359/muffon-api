module YandexMusic
  module Artist
    class Albums < YandexMusic::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      include Muffon::Utils::Pagination

      private

      def no_data?
        albums_list.blank?
      end

      def albums_list
        @albums_list ||= response_data['albums']
      end

      def params
        super.merge(albums_params)
      end

      def albums_params
        {
          what: 'albums',
          sort: 'year'
        }
      end

      def collection_list
        collection_paginated(albums_list)
      end

      def total_items_count
        albums_list.size
      end

      def collection_item_data_formatted(album)
        YandexMusic::Artist::Albums::Album.call(
          album: album
        )
      end

      alias artist_data paginated_data
    end
  end
end
