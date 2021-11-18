module LastFM
  module Search
    class Artists < LastFM::Search::Base
      API_METHOD = 'artist.search'.freeze
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze

      private

      def collection_item_data_formatted(artist)
        LastFM::Search::Artists::Artist.call(
          artist: artist,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
