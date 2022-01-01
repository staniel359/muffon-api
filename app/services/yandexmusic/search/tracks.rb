module YandexMusic
  module Search
    class Tracks < YandexMusic::Search::Base
      COLLECTION_TYPE = 'track'.freeze
      COLLECTION_NAME = 'tracks'.freeze

      private

      def collection_item_data_formatted(track)
        YandexMusic::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
