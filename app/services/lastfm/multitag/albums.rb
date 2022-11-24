module LastFM
  module Multitag
    class Albums < LastFM::Multitag::Base
      MODEL_NAME = 'album'.freeze
      COLLECTION_NAME = 'albums'.freeze
      TOTAL_LIMIT = 1_000

      private

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
