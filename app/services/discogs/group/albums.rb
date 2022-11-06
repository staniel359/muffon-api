module Discogs
  module Group
    class Albums < Discogs::Group::Base
      COLLECTION_NAME = 'albums'.freeze

      include Discogs::Utils::Pagination

      private

      def link
        "#{super}/versions"
      end

      def total_pages_count
        album.dig(
          'pagination', 'pages'
        )
      end

      def collection_list
        album['versions']
      end

      def collection_item_data_formatted(album)
        Discogs::Group::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end

      alias group_data paginated_data
    end
  end
end
