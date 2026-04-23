module Odnoklassniki
  module Artist
    class Albums < Odnoklassniki::Artist::Base
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
          is_fractioned: true
        )
      end

      def raw_collection
        raw_artist_data['masterAlbums']
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Odnoklassniki::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
