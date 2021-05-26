module LastFM
  module Top
    class Artists < LastFM::Top::Base
      API_METHOD = 'chart.getTopArtists'.freeze
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze

      private

      def collection_list
        super.last(limit)
      end

      def collection_item_data_formatted(artist)
        LastFM::Top::Artists::Artist.call(
          artist: artist
        )
      end
    end
  end
end
