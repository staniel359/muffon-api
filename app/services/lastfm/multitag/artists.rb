module LastFM
  module Multitag
    class Artists < LastFM::Multitag::Base
      MODEL_NAME = 'artist'.freeze
      COLLECTION_NAME = 'artists'.freeze
      TOTAL_LIMIT = 1_000

      private

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
