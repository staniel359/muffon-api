module Odnoklassniki
  module Artist
    class Albums < Odnoklassniki::Base
      include Muffon::Utils::Paginated

      private

      def primary_args
        [@args.artist_id]
      end

      def endpoint_name
        'artist'
      end

      def params
        super.merge({ artistId: @args.artist_id })
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

      def collection_list
        response_data['masterAlbums']
      end

      def albums_data
        paginated_collection.map { |album| album_data(album) }
      end

      def album_data(album)
        {
          title: album['name'],
          image: album['image'],
          released: album['year'].to_s,
          odnoklassniki_id: album['id']
        }
      end
    end
  end
end
