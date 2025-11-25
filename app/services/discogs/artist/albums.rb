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
        artist['releases']
      end

      def link
        "#{super}/#{@args[:artist_id]}/releases"
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
        artist.dig(
          'pagination',
          'items'
        )
      end

      def collection_item_data_formatted(album)
        Discogs::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
