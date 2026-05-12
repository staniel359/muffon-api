module LastFM
  module Multitag
    class Tracks < LastFM::Multitag::Base
      DEFAULT_ORDER = 'listeners_count_desc'.freeze

      private

      def multitag_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        tracks
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .with_relations
      end

      def tracks
        @tracks ||=
          ::Track.with_tags(
            tags_names: @args[:tags]
          )
      end

      def items_count
        tracks.count
      end

      def collection_item_data_formatted(
        track_record
      )
        Muffon::Formatter::Multitag::Tracks::Track.call(
          track_record:,
          **self_args
        )
      end
    end
  end
end
