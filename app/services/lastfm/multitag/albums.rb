module LastFM
  module Multitag
    class Albums < LastFM::Multitag::Base
      private

      def multitag_data
        paginated_data(
          collection_name: 'albums',
          raw_collection: [],
          page:,
          limit:
        )
      end

      def collection_item_data_formatted(album)
        LastFM::Multitag::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
