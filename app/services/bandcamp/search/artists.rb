module Bandcamp
  module Search
    class Artists < Bandcamp::Search::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def collection_item_data_formatted(artist)
        Bandcamp::Search::Artists::Artist.call(
          artist: artist,
          profile_id: @args.profile_id
        )
      end
    end
  end
end
