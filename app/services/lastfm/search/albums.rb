module LastFM
  module Search
    class Albums < LastFM::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(album)
        LastFM::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
