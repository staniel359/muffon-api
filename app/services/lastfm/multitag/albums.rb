module LastFM
  module Multitag
    class Albums < LastFM::Multitag::Base
      DEFAULT_ORDER = 'listeners_count_desc'.freeze

      private

      def multitag_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        albums
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def albums
        @albums ||=
          ::Album.with_tags(
            @args[:tags]
          )
      end

      def items_count
        albums.count
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        LastFM::Multitag::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
