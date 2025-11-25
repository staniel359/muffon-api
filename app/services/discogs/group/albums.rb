module Discogs
  module Group
    class Albums < Discogs::Group::Base
      private

      def group_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          pages_count:
        )
      end

      def raw_collection
        album['versions']
      end

      def link
        "#{super}/versions"
      end

      def params
        {
          **super,
          page:,
          per_page: limit
        }
      end

      def pages_count
        album.dig(
          'pagination',
          'pages'
        )
      end

      def collection_item_data_formatted(album)
        Discogs::Group::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
