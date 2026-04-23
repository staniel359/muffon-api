module Bandcamp
  module Artist
    class Albums < Bandcamp::Artist::Base
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
          limit:,
          page:,
          is_fractioned: true
        )
      end

      def raw_collection
        response_data['discography']
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Bandcamp::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
