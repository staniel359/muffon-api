module LastFM
  module Search
    class Artists < LastFM::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(artist)
        LastFM::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
