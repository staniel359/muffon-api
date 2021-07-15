module SoundCloud
  module Search
    class Artists < SoundCloud::Search::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def link
        "#{BASE_LINK}/search/users"
      end

      def collection_item_data_formatted(artist)
        SoundCloud::Search::Artists::Artist.call(
          artist: artist
        )
      end
    end
  end
end
