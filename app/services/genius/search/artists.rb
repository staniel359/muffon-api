module Genius
  module Search
    class Artists < Genius::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze

      private

      def collection_item_data_formatted(artist)
        Genius::Search::Artists::Artist.call(
          artist: artist['result'],
          profile_id: @args.profile_id
        )
      end
    end
  end
end
