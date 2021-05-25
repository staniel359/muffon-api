module Discogs
  module Label
    class Albums < Discogs::Label::Base
      COLLECTION_NAME = 'albums'.freeze
      include Discogs::Utils::Pagination

      private

      def link
        "#{super}/releases"
      end

      def params
        super.merge(sort_params)
      end

      def sort_params
        {
          sort: 'year',
          sort_order: 'desc'
        }
      end

      def total_pages_count
        artist.dig(
          'pagination', 'pages'
        )
      end

      def collection_list
        artist['releases']
      end

      def collection_item_data_formatted(album)
        Discogs::Label::Albums::Album.call(
          album: album
        )
      end

      alias label_data paginated_data
    end
  end
end
