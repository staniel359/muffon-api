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

      def collection_item_data_formatted(artist)
        Bandcamp::Label::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
