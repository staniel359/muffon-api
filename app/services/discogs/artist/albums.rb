module Discogs
  module Artist
    class Albums < Discogs::Artist::Base
      private

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          items_count:,
          page:,
          limit:
        )
      end

      def raw_collection
        raw_artist_data['releases']
      end

      def link
        "#{BASE_LINK}/#{@args[:artist_id]}/releases"
      end

      def params
        {
          **super,
          page:,
          per_page: limit,
          sort: 'year',
          sort_order: 'desc'
        }
      end

      def items_count
        raw_artist_data.dig(
          'pagination',
          'items'
        )
      end

      def collection_item_data_formatted(
        raw_album_group_data
      )
        Discogs::Artist::Albums::Album.call(
          raw_album_group_data:,
          **self_args
        )
      end
    end
  end
end
