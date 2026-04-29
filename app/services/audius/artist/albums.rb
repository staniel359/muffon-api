module Audius
  module Artist
    class Albums < Audius::Artist::Base
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
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        response_data['data']
      end

      def link
        "#{super}/albums"
      end

      def params
        {
          **super,
          offset:,
          limit:
        }
      end

      def items_count
        artist_info_data.dig(
          :artist,
          :albums_count
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Audius::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
