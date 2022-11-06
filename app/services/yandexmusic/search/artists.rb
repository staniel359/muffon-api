module YandexMusic
  module Search
    class Artists < YandexMusic::Search::Base
      COLLECTION_TYPE = 'artist'.freeze
      COLLECTION_NAME = 'artists'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(artist)
        YandexMusic::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
