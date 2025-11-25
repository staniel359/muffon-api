module LastFM
  module Multitag
    class Artists < LastFM::Multitag::Base
      private

      def multitag_data
        paginated_data(
          collection_name: 'artists',
          raw_collection: [],
          page:,
          limit:
        )
      end

      def collection_item_data_formatted(artist)
        LastFM::Multitag::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
