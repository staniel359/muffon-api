module LastFM
  module Multitag
    class Artists < LastFM::Multitag::Base
      DEFAULT_ORDER = 'listeners_count_desc'.freeze

      private

      def multitag_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        artists
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
      end

      def artists
        @artists ||=
          ::Artist.with_tags(
            tags_names: @args[:tags]
          )
      end

      def items_count
        artists.count
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        LastFM::Multitag::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
