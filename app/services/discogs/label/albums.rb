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
        raw_label_data['releases']
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
        raw_label_data.dig(
          'pagination',
          'pages'
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Discogs::Label::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
