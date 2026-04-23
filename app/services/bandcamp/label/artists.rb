module Bandcamp
  module Label
    class Artists < Bandcamp::Label::Base
      private

      def label_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        response_data['artists']
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        Bandcamp::Label::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
