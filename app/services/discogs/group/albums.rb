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
        raw_album_group_data['versions']
      end

      def request_url
        "#{super}/versions"
      end

      def request_params
        {
          **super,
          page:,
          per_page: limit
        }
      end

      def pages_count
        raw_album_group_data.dig(
          'pagination',
          'pages'
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Discogs::Group::Albums::Album.call(
          raw_album_data:,
          artists:,
          **self_args
        )
      end

      def artists
        group_info_data[:artists]
      end

      def group_info_data
        @group_info_data ||=
          Discogs::Group::Info.call(
            group_id: @args[:group_id]
          )[:group]
      end
    end
  end
end
