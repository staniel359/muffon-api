module LastFM
  module Top
    class Artists < LastFM::Top::Base
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze
      TOTAL_LIMIT = 1_000

      private

      def collection_item_data_formatted(artist)
        LastFM::Top::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
