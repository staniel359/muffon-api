module MusixMatch
  module Search
    class Artists < MusixMatch::Search::Base
      MODEL_NAME = 'artist'.freeze
      COLLECTION_NAME = 'artists'.freeze

      private

      def collection_item_data_formatted(artist)
        MusixMatch::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
