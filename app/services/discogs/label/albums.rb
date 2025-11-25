module Discogs
  module Label
    class Albums < Discogs::Label::Base
      private

      def label_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          pages_count:
        )
      end

      def raw_collection
        artist['releases']
      end

      def link
        "#{super}/releases"
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

      def pages_count
        artist.dig(
          'pagination',
          'pages'
        )
      end

      def collection_item_data_formatted(album)
        Discogs::Label::Albums::Album.call(
          album:
        )
      end
    end
  end
end
